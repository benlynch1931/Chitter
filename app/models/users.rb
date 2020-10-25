# frozen_string_leteral: false

require 'pg'

# This class controls users in the database

class User

  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(name:, username:, email:, password:)
    initialize_database
    result = @db.exec(
      "INSERT INTO users(name, username, user_email, user_password)
      VALUES('#{name}','#{username}','#{email}','#{password}')
      RETURNING user_id, user_email, username;"
    )
    User.new(id: result[0]['user_id'], email: result[0]['user_email'], username: result[0]['username'])
  end

  def self.find
  end

  def self.id
    @@db.exec(
      "SELECT user_id FROM users WHERE name='#{name}', user_email='#{email}', user_password='#{password}'"
    )
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
      @db = PG.connect(dbname: database_name)
    rescue PG::Error
      puts "Error loading database. Check correct information has been provided..."
    ensure
      puts message
    end
  end
end
