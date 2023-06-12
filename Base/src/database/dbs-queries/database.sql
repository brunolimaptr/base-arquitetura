-- Active: 1673961752633@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL
);

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT(0) NOT NULL,
    dislikes INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes(
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

DROP TABLE users;
DROP TABLE posts;
DROP TABLE likes_dislikes;

INSERT INTO users(id, name, email, password, role, created_at, updated_at)
VALUES
("5c417d47-af6d-48d1-af6e-e2d2741b5850","Alexandre Machado","alexandre@email.com","$2a$12$skjToNI2gCW02HT3OtzskuhwNwbzYJFJ1RaU2YYWOV/bZTtdCEd9m","ADMIN",DATETIME(),DATETIME()),
("5ebc150d-f322-4c15-a01e-f68229d14dae","Andre Ferreira","andre@email.com","$2a$12$skjToNI2gCW02HT3OtzskuhwNwbzYJFJ1RaU2YYWOV/bZTtdCEd9m","NORMAL",DATETIME(),DATETIME()),
("6d242db6-5af7-4023-83c8-a8852ec754aa","Alex Campolina","alex@email.com","$2a$12$skjToNI2gCW02HT3OtzskuhwNwbzYJFJ1RaU2YYWOV/bZTtdCEd9m","NORMAL",DATETIME(),DATETIME()),
("934a424a-a33f-4e63-8a5f-56f884620660","Camila Campolina","camila@email.com","$2a$12$skjToNI2gCW02HT3OtzskuhwNwbzYJFJ1RaU2YYWOV/bZTtdCEd9m","NORMAL",DATETIME(),DATETIME());

INSERT INTO posts(id,creator_id, content, created_at, updated_at)
VALUES
("44725dc0-a3f6-4f2a-9810-ea68984b7b94","5c417d47-af6d-48d1-af6e-e2d2741b5850","Usuario 1 texto 1",DATETIME(),DATETIME()),
("3fb04f59-c749-4e4f-a639-75993ef4a60e","5ebc150d-f322-4c15-a01e-f68229d14dae","Usuario 2 texto 2",DATETIME(),DATETIME()),
("36b1a067-d99f-4906-8087-6a50d25bdacc","5c417d47-af6d-48d1-af6e-e2d2741b5850","Usuario 1 texto 3",DATETIME(),DATETIME()),
("f1c9a102-ef52-4ebc-91f3-f7b0bad925d7","6d242db6-5af7-4023-83c8-a8852ec754aa","Usuario 3 texto 4",DATETIME(),DATETIME());


SELECT * FROM users;