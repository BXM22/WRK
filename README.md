# Workout Tracker

A full-stack workout tracking app: Go REST API + PostgreSQL backend, React SPA frontend. Built as a portfolio project.

## Stack

| Layer | Choice | Why |
|---|---|---|
| Backend | Go (net/http + chi router) | Matches what you want to showcase; chi is lightweight, no heavy framework magic |
| Database | PostgreSQL | Realistic, shows relational modeling + migrations |
| DB access | sqlc or database/sql + pgx | Type-safe SQL, no ORM magic to explain in an interview |
| Migrations | golang-migrate | Standard, versioned schema changes |
| Frontend | React (Vite) + TypeScript | SPA talking to the Go API over JSON |
| Auth | None in v1 | Single user, no login — see "Future" for adding it later |
| Dev environment | Docker Compose (Postgres + API) | One command to spin up locally |

## Data model (v1)

**exercises**
- id (uuid/serial, pk)
- name (text, unique)
- muscle_group (text) — e.g. chest, back, legs, shoulders, arms, core
- equipment (text) — e.g. barbell, dumbbell, bodyweight, machine
- instructions (text, nullable)
- is_custom (bool) — false for seeded exercises, true for user-added
- created_at

**routines** (named workout templates, e.g. "Push Day")
- id (pk)
- name (text)
- description (text, nullable)
- created_at

**routine_exercises** (join table: which exercises belong to a routine, in what order)
- id (pk)
- routine_id (fk -> routines)
- exercise_id (fk -> exercises)
- order_index (int)
- target_sets (int, nullable)
- target_reps (int, nullable)

**workout_sessions** (an actual instance of doing a workout on a date)
- id (pk)
- routine_id (fk -> routines, nullable — sessions can be freeform, not tied to a routine)
- date (date)
- notes (text, nullable)
- created_at

**sets** (individual logged sets within a session)
- id (pk)
- session_id (fk -> workout_sessions)
- exercise_id (fk -> exercises)
- set_number (int)
- reps (int)
- weight (numeric, nullable — bodyweight exercises may have no weight)
- created_at

## Seeded exercise library

On first migration, seed ~30-40 common exercises across muscle groups (bench press, squat, deadlift, overhead press, pull-up, row, bicep curl, plank, etc.) with `is_custom = false`. Users can add their own on top with `is_custom = true`.

## API (v1 endpoints)

**Exercises**
- `GET /api/exercises` — list all (filter by `?muscle_group=`)
- `GET /api/exercises/{id}`
- `POST /api/exercises` — add custom exercise
- `PUT /api/exercises/{id}`
- `DELETE /api/exercises/{id}` — only custom ones

**Routines**
- `GET /api/routines`
- `GET /api/routines/{id}` — includes its exercises
- `POST /api/routines`
- `PUT /api/routines/{id}`
- `DELETE /api/routines/{id}`

**Workout sessions**
- `GET /api/sessions` — list, filter by date range
- `GET /api/sessions/{id}` — includes all logged sets
- `POST /api/sessions` — start a session (optionally from a routine)
- `POST /api/sessions/{id}/sets` — log a set
- `PUT /api/sets/{id}` — edit a logged set
- `DELETE /api/sets/{id}`

**Stats**
- `GET /api/stats/exercise/{id}` — weight/reps progression over time for one exercise
- `GET /api/stats/volume?from=&to=` — total volume (sets × reps × weight) per week

## Project structure

```
workout-app/
├── backend/
│   ├── cmd/api/main.go
│   ├── internal/
│   │   ├── db/            # sqlc-generated code + queries.sql
│   │   ├── exercises/     # handlers + business logic
│   │   ├── routines/
│   │   ├── sessions/
│   │   └── stats/
│   ├── migrations/
│   ├── go.mod
│   └── Dockerfile
├── frontend/
│   ├── src/
│   │   ├── pages/         # Exercises, Routines, Log Workout, Progress
│   │   ├── api/           # fetch wrappers for the Go API
│   │   └── components/
│   ├── package.json
│   └── vite.config.ts
├── docker-compose.yml
└── README.md
```

## Build order

1. Postgres schema + migrations + seed data
2. Go API: exercises CRUD (simplest slice, proves the whole stack end to end)
3. Go API: routines CRUD
4. Go API: sessions + sets logging
5. Go API: stats endpoints
6. React app: exercise library page (list/add/edit)
7. React app: routine builder
8. React app: log-a-workout flow
9. React app: progress charts (e.g. recharts) for a chosen exercise
10. Docker Compose to run the whole thing with one command
11. (Stretch) Add auth (JWT) so it's multi-user-ready — good "v2" talking point in interviews

## Future / stretch ideas
- Auth + multi-user support
- Personal records (auto-detect PRs when a set beats a previous best)
- Rest timer in the UI
- Export workout history to CSV
- Deploy: API on Fly.io/Render, frontend on Vercel/Netlify, Postgres on Neon/Supabase
