CREATE TABLE users(user_id SERIAL PRIMARY KEY,  name VARCHAR(20), username VARCHAR(20), user_email VARCHAR(60), user_password VARCHAR(140));

INSERT INTO users(name, username, user_email, user_password) VALUES('ADMIN', 'ADMIN', 'admin@ex.com', 'password123');

CREATE TABLE peeps(
  peep_id SERIAL PRIMARY KEY,
  peep_date DATE,
  peep_time TIME,
  user_id INT REFERENCES users,
  body VARCHAR(600)
);

INSERT INTO peeps(peep_date, peep_time, user_id, body) VALUES('2020-10-24', '10:45:20', 1, 'First Peep!');
INSERT INTO peeps(peep_date, peep_time, user_id, body) VALUES('2020-10-24', '11:13:39', 1, 'Second Peep!');
INSERT INTO peeps(peep_date, peep_time, user_id, body) VALUES('2020-10-24', '12:30:02', 1, 'Third Peep!');
