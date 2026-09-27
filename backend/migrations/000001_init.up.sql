BEGIN;

CREATE TABLE exercises (
    id           uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    name         text        NOT NULL UNIQUE,
    muscle_group text        NOT NULL,
    equipment    text        NOT NULL,
    instructions text,
    is_custom    boolean     NOT NULL DEFAULT false,
    created_at   timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE routines (
    id          uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    name        text        NOT NULL,
    description text,
    created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE routine_exercises (
    id          uuid    PRIMARY KEY DEFAULT gen_random_uuid(),
    -- Deleting a routine removes its exercise list.
    routine_id  uuid    NOT NULL REFERENCES routines (id) ON DELETE CASCADE,
    -- An exercise still used by a routine cannot be deleted.
    exercise_id uuid    NOT NULL REFERENCES exercises (id) ON DELETE RESTRICT,
    order_index integer NOT NULL,
    target_sets integer,
    target_reps integer
);

CREATE INDEX routine_exercises_routine_id_idx ON routine_exercises (routine_id);
CREATE INDEX routine_exercises_exercise_id_idx ON routine_exercises (exercise_id);

CREATE TABLE workout_sessions (
    id         uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    -- Nullable: sessions can be freeform. Deleting a routine keeps its history.
    routine_id uuid        REFERENCES routines (id) ON DELETE SET NULL,
    date       date        NOT NULL,
    notes      text,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX workout_sessions_routine_id_idx ON workout_sessions (routine_id);
CREATE INDEX workout_sessions_date_idx ON workout_sessions (date);

CREATE TABLE sets (
    id          uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    -- Deleting a session removes its sets.
    session_id  uuid        NOT NULL REFERENCES workout_sessions (id) ON DELETE CASCADE,
    -- An exercise with logged history cannot be deleted.
    exercise_id uuid        NOT NULL REFERENCES exercises (id) ON DELETE RESTRICT,
    set_number  integer     NOT NULL,
    reps        integer     NOT NULL,
    -- Nullable: bodyweight exercises may have no weight.
    weight      numeric,
    created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX sets_session_id_idx ON sets (session_id);
CREATE INDEX sets_exercise_id_idx ON sets (exercise_id);

COMMIT;
