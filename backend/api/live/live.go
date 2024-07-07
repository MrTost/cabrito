package live

import (
	"cabrito/database"
	"cabrito/types"
)

type Jobs struct {
	iptvOrg types.JobStatus
}

type Api struct {
	db   *database.Persist
	jobs Jobs
}

func Create(db *database.Persist) *Api {
	return &Api{
		db: db,
		jobs: Jobs{
			iptvOrg: types.JobStatus{Running: false},
		},
	}
}
