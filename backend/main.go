package main

import (
	"embed"
	"io/fs"
	"log"
	"net/http"
)

//go:embed webapp/*
var webAppFiles embed.FS

//go:embed webapp/browser/index.html
var indexContent []byte

func main() {
	log.Println("Cabrito Server initiating")

	mux := http.NewServeMux()

	webApp, err := fs.Sub(webAppFiles, "webapp/browser")
	if err != nil {
		log.Fatal(err)
	}

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

	log.Println("Server is running on port 8080")

	err = http.ListenAndServe(":8080", mux)
	if err != nil {
		log.Fatal(err)
	}

	log.Println("Cabrito Server terminated")
}
