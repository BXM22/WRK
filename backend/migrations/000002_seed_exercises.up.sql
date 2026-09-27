INSERT INTO exercises (name, muscle_group, equipment, instructions, is_custom) VALUES
    -- chest
    ('Barbell Bench Press',            'chest',     'barbell',    'Lie on a flat bench, lower the bar to mid-chest, press to lockout.', false),
    ('Dumbbell Bench Press',           'chest',     'dumbbell',   'Lie on a flat bench, lower the dumbbells beside the chest, press up.', false),
    ('Incline Dumbbell Press',         'chest',     'dumbbell',   'On a 30-45 degree incline bench, press dumbbells from upper chest to lockout.', false),
    ('Dumbbell Fly',                   'chest',     'dumbbell',   'With a slight elbow bend, open the arms wide, then squeeze the dumbbells back together.', false),
    ('Cable Crossover',                'chest',     'cable',      'From high pulleys, bring the handles down and together in front of the hips.', false),
    ('Push-Up',                        'chest',     'bodyweight', 'Keep a straight body line, lower the chest to the floor, push back up.', false),
    ('Chest Dip',                      'chest',     'bodyweight', 'Lean forward on parallel bars, lower until shoulders are below elbows, press up.', false),

    -- back
    ('Deadlift',                       'back',      'barbell',    'Hinge at the hips with a neutral spine, drive through the floor to stand tall.', false),
    ('Pull-Up',                        'back',      'bodyweight', 'Hang with an overhand grip, pull until the chin clears the bar.', false),
    ('Barbell Row',                    'back',      'barbell',    'Hinge forward with a flat back, row the bar to the lower ribs.', false),
    ('Dumbbell Row',                   'back',      'dumbbell',   'Brace on a bench, row the dumbbell toward the hip.', false),
    ('Lat Pulldown',                   'back',      'cable',      'Pull the bar to the upper chest, driving the elbows down and back.', false),
    ('Seated Cable Row',               'back',      'cable',      'Sit tall, row the handle to the stomach, squeeze the shoulder blades.', false),

    -- legs
    ('Back Squat',                     'legs',      'barbell',    'Bar on upper back, squat to at least parallel, drive back up.', false),
    ('Romanian Deadlift',              'legs',      'barbell',    'Soft knees, hinge at the hips lowering the bar along the legs, then stand.', false),
    ('Leg Press',                      'legs',      'machine',    'Lower the sled until knees reach about 90 degrees, press back up.', false),
    ('Walking Lunge',                  'legs',      'dumbbell',   'Step forward into a lunge, back knee near the floor, alternate legs.', false),
    ('Bulgarian Split Squat',          'legs',      'dumbbell',   'Rear foot on a bench, lower the back knee toward the floor, drive up.', false),
    ('Hip Thrust',                     'legs',      'barbell',    'Upper back on a bench, bar over hips, drive hips up to full extension.', false),
    ('Leg Curl',                       'legs',      'machine',    'Curl the pad toward the glutes, control the return.', false),
    ('Leg Extension',                  'legs',      'machine',    'Extend the knees to straighten the legs, control the return.', false),
    ('Standing Calf Raise',            'legs',      'machine',    'Rise onto the toes as high as possible, lower for a full stretch.', false),

    -- shoulders
    ('Overhead Press',                 'shoulders', 'barbell',    'Standing, press the bar from the shoulders to overhead lockout.', false),
    ('Seated Dumbbell Shoulder Press', 'shoulders', 'dumbbell',   'Seated upright, press dumbbells from shoulder height to overhead.', false),
    ('Lateral Raise',                  'shoulders', 'dumbbell',   'Raise dumbbells out to the sides to shoulder height.', false),
    ('Rear Delt Fly',                  'shoulders', 'dumbbell',   'Hinged forward, raise dumbbells out to the sides leading with the elbows.', false),
    ('Face Pull',                      'shoulders', 'cable',      'Pull a rope toward the face, elbows high, rotating the hands apart.', false),

    -- arms
    ('Barbell Curl',                   'arms',      'barbell',    'Elbows pinned at the sides, curl the bar to the shoulders.', false),
    ('Dumbbell Curl',                  'arms',      'dumbbell',   'Curl dumbbells with palms up, keeping elbows still.', false),
    ('Hammer Curl',                    'arms',      'dumbbell',   'Curl dumbbells with a neutral (palms-in) grip.', false),
    ('Tricep Pushdown',                'arms',      'cable',      'Elbows at the sides, push the bar or rope down to full extension.', false),
    ('Skull Crusher',                  'arms',      'barbell',    'Lying on a bench, lower the bar toward the forehead, extend the elbows.', false),
    ('Overhead Tricep Extension',      'arms',      'dumbbell',   'Hold a dumbbell overhead, lower it behind the head, extend back up.', false),

    -- core
    ('Plank',                          'core',      'bodyweight', 'Hold a straight line from head to heels on forearms and toes.', false),
    ('Hanging Leg Raise',              'core',      'bodyweight', 'Hang from a bar, raise straight legs to hip height or above.', false),
    ('Cable Crunch',                   'core',      'cable',      'Kneeling, crunch the rope down by flexing the spine.', false),
    ('Russian Twist',                  'core',      'bodyweight', 'Seated with feet raised, rotate the torso side to side.', false);
