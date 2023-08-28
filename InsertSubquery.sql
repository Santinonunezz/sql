INSERT INTO user (username, password)
SELECT "pepe", password FROM user WHERE username like "carlos"