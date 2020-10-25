def truncate_table
  @db = PG.connect(dbname: 'chitter_manager_test')
  @db.exec("TRUNCATE TABLE peeps, users RESTART IDENTITY;")
end

def populate_table
  @db = PG.connect(dbname: 'chitter_manager_test')
  @db.exec(
    "INSERT INTO users(name, username, user_email, user_password) VALUES('ADMIN', 'ADMIN', 'admin@ex.com', 'password123');
    INSERT INTO peeps(peep_date, peep_time, user_id, body) VALUES('2020-10-24', '10:45:20', 1, 'First Peep!');
    INSERT INTO peeps(peep_date, peep_time, user_id, body) VALUES('2020-10-24', '11:13:39', 1, 'Second Peep!');
    INSERT INTO peeps(peep_date, peep_time, user_id, body) VALUES('2020-10-24', '12:30:02', 1, 'Third Peep!');
  ")
end
