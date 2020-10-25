# frozen_string_leteral: false

require 'pg'
require './app/models/existing_peeps.rb'

# This class controls data flow into and out of the chitter database
class Database

  def self.test_init
    initialize_database
  end

  def self.insert_peep_into_db(id_user: 1, body:)
    initialize_database
    insert = @@db.exec(
      "INSERT INTO peeps(peep_date, peep_time, user_id, body)
      VALUES ('#{Date.today.strftime('%Y-%m-%d')}', '#{Time.now.strftime('%T')}', '#{id_user}', '#{body}');"
    )
  end

  def self.access_specify(condition:)
    initialize_database
    result = @@db.exec(
      "SELECT * FROM peeps INNER JOIN users ON peeps.user_id = users.user_id #{condition} ORDER BY peep_date DESC, peep_time DESC;"
    )
    # result.map { |each| [each['peep_date'],each['peep_time'], each['username'], each['body']]}
    map_result(result: result)
  end

  def self.access_all
    initialize_database
    result = @@db.exec(
      "SELECT * FROM peeps INNER JOIN users ON peeps.user_id = users.user_id ORDER BY peep_date DESC, peep_time DESC;"
    )
    # result.map { |each| [each['peep_date'],each['peep_time'], each['username'], each['body']]}
    map_result(result: result)
  end

  private

  def self.initialize_database
    if ENV["CHITTER_ENV"] == 'test'
      database_name = 'chitter_manager_test'
      message = 'Successfully connected to Test Database'
    else
      database_name = "chitter_manager"
      message = 'Successfully connected to Development Database'
    end
    begin
      @@db = PG.connect(dbname: database_name)
    rescue PG::Error
      puts "Error loading database. Check correct information has been provided..."
    ensure
      puts message
    end
  end

  def self.map_result(result:)
    result.map { |each| ExistingPeeps.new(each['peep_id'], each['peep_date'], each['peep_time'], each['user_id'], each['username'], each['body'])}
  end
end
