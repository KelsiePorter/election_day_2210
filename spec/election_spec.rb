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

  it 'An election has multiple candidates' do 
    race1 = Race.new("Virginia District 4 Representative")
    race2 = Race.new("Texas Governor")

    election.add_race(race1)
    election.add_race(race2)

    expect(election.candidates).to eq([])

    candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
    candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
    candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
    candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})

    expect(election.candidates).to eq([candidate1, candidate2, candidate3, candidate4, candidate5])
  end

  it 'An election counts the number of votes received' do 
    race1 = Race.new("Virginia District 4 Representative")
    race2 = Race.new("Texas Governor")
    candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
    candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
    candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
    candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})

    election.add_race(race1)
    election.add_race(race2)

    4.times {candidate1.vote_for!}


  end

end