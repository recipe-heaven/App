\c fractal


-- table with users
CREATE TABLE IF NOT EXISTS users
(
    id       serial primary key not null,
    name     text               not null,
    email    text               not null,
    password text               not null,
    created  bigint DEFAULT extract(epoch from now())

);

CREATE TABLE IF NOT EXISTS ingredient_units
(
    tag text primary key not null
);

CREATE TABLE IF NOT EXISTS ingredient_units
(
    unit text primary key not null
);


CREATE TABLE IF NOT EXISTS ingredient
(
    name text primary key not null
);


-- Course
CREATE TABLE IF NOT EXISTS courses
(
    id          serial primary key not null,
    creator     int references users (id),

    name        text               not null,
    description text,
    cook_time   int -- unix time stamp for the win


);

CREATE TABLE IF NOT EXISTS course_steps
(
    course_id int references courses (id) not null,
    number    int                         not null,
    step      text                        not null
);

CREATE TABLE IF NOT EXISTS course_tags
(
    course_id int references courses (id) not null,
    tag       text references course_tags (tag)
);

CREATE TABLE IF NOT EXISTS course_ingredients
(
    course_id  int references courses (id)                   not null,
    ingredient text references ingredient (name) primary key not null,
    unit       text references ingredient_units (unit)       not null,
    amount     int                                           not null
);


-- when what user entered what station
CREATE TABLE IF NOT EXISTS meals
(
    id          serial primary key not null,
    creator     int references users (id),
    main_course int references courses (id)
);

CREATE TABLE IF NOT EXISTS meal_courses
(

    course int references courses (id),
    meal   int references meals (id) not null
);

CREATE TABLE IF NOT EXISTS menus
(
    id      serial primary key not null,
    creator int references users (id)
);

CREATE TABLE IF NOT EXISTS menu_meals
(

    menu  int references menus (id),
    index int                       not null,
    meal  int references meals (id) not null
);

