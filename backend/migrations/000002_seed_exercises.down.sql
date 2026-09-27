DELETE FROM exercises
WHERE is_custom = false
  AND name IN (
    'Barbell Bench Press', 'Dumbbell Bench Press', 'Incline Dumbbell Press', 'Dumbbell Fly',
    'Cable Crossover', 'Push-Up', 'Chest Dip',
    'Deadlift', 'Pull-Up', 'Barbell Row', 'Dumbbell Row', 'Lat Pulldown', 'Seated Cable Row',
    'Back Squat', 'Romanian Deadlift', 'Leg Press', 'Walking Lunge', 'Bulgarian Split Squat',
    'Hip Thrust', 'Leg Curl', 'Leg Extension', 'Standing Calf Raise',
    'Overhead Press', 'Seated Dumbbell Shoulder Press', 'Lateral Raise', 'Rear Delt Fly', 'Face Pull',
    'Barbell Curl', 'Dumbbell Curl', 'Hammer Curl', 'Tricep Pushdown', 'Skull Crusher',
    'Overhead Tricep Extension',
    'Plank', 'Hanging Leg Raise', 'Cable Crunch', 'Russian Twist'
  );
