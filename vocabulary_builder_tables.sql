CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255) -- Make sure to store hashed passwords
);

CREATE TABLE languages (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE user_languages (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    language_id INT REFERENCES languages(id) ON DELETE CASCADE
);

CREATE TABLE words (
    id SERIAL PRIMARY KEY,
    word VARCHAR(100) NOT NULL,
    translation VARCHAR(100),
    example VARCHAR(255),
    learned BOOLEAN DEFAULT FALSE,
    user_language_id INT REFERENCES user_languages(id) ON DELETE CASCADE
);


-- Insert users
INSERT INTO users (name, email, password)
VALUES 
    ('John Doe', 'john.doe@example.com', 'hashed_password_1'),
    ('Jane Smith', 'jane.smith@example.com', 'hashed_password_2');

-- Insert languages
INSERT INTO languages (name)
VALUES 
    ('Russian'),
    ('French');

-- Assign languages to users
-- User 1 will learn Russian
INSERT INTO user_languages (user_id, language_id)
VALUES 
    (1, 1);

-- User 2 will learn French
INSERT INTO user_languages (user_id, language_id)
VALUES 
    (2, 2);

-- Insert words for Russian language (for User 1)
INSERT INTO words (word, translation, example, learned, user_language_id)
VALUES
    ('Привет', 'Hello', 'Привет, как дела?', FALSE, 1),
    ('Спасибо', 'Thank you', 'Спасибо за помощь!', FALSE, 1),
    ('Книга', 'Book', 'Я читаю интересную книгу.', FALSE, 1),
    ('Друзья', 'Friends', 'У меня много друзей.', FALSE, 1),
    ('Собака', 'Dog', 'Моя собака лает.', FALSE, 1);

-- Insert words for French language (for User 2)
INSERT INTO words (word, translation, example, learned, user_language_id)
VALUES
    ('Bonjour', 'Hello', 'Bonjour, comment ça va?', FALSE, 2),
    ('Merci', 'Thank you', 'Merci pour votre aide!', FALSE, 2),
    ('Livre', 'Book', 'Je lis un livre intéressant.', FALSE, 2),
    ('Amis', 'Friends', 'J’ai beaucoup d’amis.', FALSE, 2),
    ('Chien', 'Dog', 'Mon chien aboie.', FALSE, 2);

select * from users;
select * from user_languages;
select * from words;


