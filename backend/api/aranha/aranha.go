package aranha

import (
	"cabrito/database"
	"cabrito/types"
	"encoding/json"
	"net/http"
)

type Jobs struct {
	a1 types.JobStatus
}

type Api struct {
	db   *database.Persist
	jobs Jobs
}

func Create(db *database.Persist) *Api {
	return &Api{
		db: db,
		jobs: Jobs{
			a1: types.JobStatus{Running: false},
		},
	}
}

func (api *Api) Save(w http.ResponseWriter, r *http.Request) {
	var aranha types.Aranha
	err := json.NewDecoder(r.Body).Decode(&aranha)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	err = api.db.Aranha.Save(&aranha)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
}

func (api *Api) Search(w http.ResponseWriter, r *http.Request) {
	// TODO
}
