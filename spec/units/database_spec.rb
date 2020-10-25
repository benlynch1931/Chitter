require './app/models/database.rb'
require './app/models/existing_peeps.rb'

describe Database do
  date = Date.today.strftime('%Y-%m-%d')
  time = Time.now.strftime('%T')
  insert_peep = ['4', "#{date}","#{time}", '1', 'ADMIN', 'Test Peep']
  specify_peep = ['1', '2020-10-24','10:45:20', '1', 'ADMIN', 'First Peep!']
  all_peep = [
    ['1', '2020-10-24','10:45:20', '1', 'ADMIN', 'First Peep!'],
    ['2', '2020-10-24','11:13:39', '1', 'ADMIN', 'Second Peep!'],
    ['3', '2020-10-24','12:30:02', '1', 'ADMIN', 'Third Peep!']
  ]

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
      result = Database.access_specify(condition: "WHERE peeps.body='Test Peep'").first
      expect(result.id).to eq insert_peep[0]
      expect(result.date).to eq insert_peep[1]
      expect(result.time).to eq insert_peep[2]
      expect(result.user_id).to eq insert_peep[3]
      expect(result.username).to eq insert_peep[4]
      expect(result.body).to eq insert_peep[5]
    end
  end

  context ' #access_specify' do

    it "accesses specific peeps from database" do
      result = Database.access_specify(condition: "WHERE peeps.body='First Peep!'").first
      expect(result.id).to eq specify_peep[0]
      expect(result.date).to eq specify_peep[1]
      expect(result.time).to eq specify_peep[2]
      expect(result.user_id).to eq specify_peep[3]
      expect(result.username).to eq specify_peep[4]
      expect(result.body).to eq specify_peep[5]
    end
  end

  context ' #access_all' do

    it "accesses all peeps from database" do
      result = Database.access_all
      3.times { |idx|
        expect(result[idx].id).to eq all_peep[-idx - 1][0]
        expect(result[idx].date).to eq all_peep[-idx - 1][1]
        expect(result[idx].time).to eq all_peep[-idx - 1][2]
        expect(result[idx].user_id).to eq all_peep[-idx - 1][3]
        expect(result[idx].username).to eq all_peep[-idx - 1][4]
        expect(result[idx].body).to eq all_peep[-idx - 1][5]
      }
    end
  end

  context ' #map_result' do

    it "Maps all peeps into their own instance" do
      Database.access_all.each { |each|
        expect(each).to be_an_instance_of(ExistingPeeps)
      }
    end
  end
end
