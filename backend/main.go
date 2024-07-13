package main

import (
	"cabrito/api"
	"cabrito/database"
	"embed"
	"io/fs"
	"log"
	"net/http"
	"strings"
)

func main() {
	log.Println("Cabrito Server initiating")

	database.RunMigration()

	persist, dbPool := database.Create()
	defer dbPool.Close()

	mux := api.Create(persist)

	hostWebapp(mux)

	log.Println("Server is running on port 8080")

	err := http.ListenAndServe(":8080", mux)
	if err != nil {
		log.Fatal(err)
	}

	log.Println("Cabrito Server terminated")
}

//go:embed webapp/*
var webAppFiles embed.FS

//go:embed webapp/browser/index.html
var indexContent []byte

func hostWebapp(mux *http.ServeMux) {
	webApp, err := fs.Sub(webAppFiles, "webapp/browser")
	if err != nil {
		log.Fatal(err)
	}

	mux.Handle("/data/", http.StripPrefix("/data/", http.FileServer(http.Dir(".data"))))
	mux.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.FS(webApp))))

	// Serve /app requests
	mux.HandleFunc("/app/{anything...}", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/html")
		_, err := w.Write(indexContent)

		if err != nil {
			http.Error(w, "Internal Server Error", http.StatusInternalServerError)
			return
		}
	})

	// Redirect requests to /app for anything other than /api or /app or /static
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if !strings.HasPrefix(r.URL.Path, "/api/") &&
			!strings.HasPrefix(r.URL.Path, "/app/") &&
			!strings.HasPrefix(r.URL.Path, "/data/") &&
			!strings.HasPrefix(r.URL.Path, "/static/") {
			http.Redirect(w, r, "/app/", http.StatusFound)
			return
		}
	})
}
