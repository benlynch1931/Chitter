require './app/models/database.rb'

describe Database do
  date = Date.today.strftime('%Y-%m-%d')
  time = Time.now.strftime('%T')
  # testing = 'RETURNING peep_date, peep_time, user_id, body'
  insert_peep = ["#{date}","#{time}", 'ADMIN', 'Test Peep']
  specify_peep = ['2020-10-24','10:45:20', 'ADMIN', 'First Peep!']

  before(:each) do
    truncate_table
    populate_table
  end

  context ' #initialize_database' do

    it 'connects to the correct database' do
      expect { Database.test_init }.to output("Successfully connected to Test Database\n").to_stdout
    end
  end

  context ' #insert_peep_into_db' do

    it "inserts a 'peep' into the correct database" do
      Database.insert_peep_into_db(id_user: 1, body: 'Test Peep')
      expect(Database.access_specify(condition: "WHERE peeps.body='Test Peep'").first).to eq insert_peep
    end
  end

  context ' #access_specify' do

    it "accesses specific peeps from database" do
      expect(Database.access_specify(condition: "WHERE peeps.body='First Peep!'").first).to eq specify_peep
    end
  end
end
