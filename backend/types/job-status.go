package types

import "sync"

type JobStatus struct {
	Running bool
	Mu      sync.Mutex
}
