require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do 
  let!(:election) {Election.new('2022')}

  it 'each election has a year' do 

    expect(election.year).to eq('2022')
  end

  it 'An election has races' do 
    race1 = Race.new("Virginia District 4 Representative")
    race2 = Race.new("Texas Governor")

    expect(election.races).to eq([])

    election.add_race(race1)
    election.add_race(race2)

    expect(election.races).to eq([race1, race2])
  end
end