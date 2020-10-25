require './app/models/users.rb'

describe User do

  before(:each) do
    truncate_table
    populate_table
  end

  context ' #create' do

    it 'inserts new user into database and returns email and id' do
      user = User.create(name: 'Ben', username: 'benlynch', email: 'ben@example.co.uk', password: 'BenIsAwesome99')
      puts user
      expect(user.id).to eq '2'
      expect(user.email).to eq 'ben@example.co.uk'
      expect(user.username).to eq 'benlynch'
    end
  end
end
