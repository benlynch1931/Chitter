CREATE TABLE users(user_id SERIAL PRIMARY KEY,  username VARCHAR(20));

INSERT INTO users(username) VALUES('ADMIN');

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
