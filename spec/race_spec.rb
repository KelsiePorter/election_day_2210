require './lib/candidate'
require './lib/race'

RSpec.describe Race do 
  let!(:race) {Race.new("Texas Governor")}

  it 'each race has an office' do 

    expect(race.office).to eq("Texas Governor")
  end

  it 'each race has candidiates running' do 
    expect(race.candidates).to eq([])

    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})

    expect(candidate1).to be_a Candidate
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)
    expect(race.candidates).to eq([candidate1])

    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    
    expect(race.candidates).to eq([candidate1, candidate2])
  end

  it 'a race is open by default' do 
    race1 = Race.new("Texas Governor")
    candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})

    expect(race1.open?).to be true
  end

  it 'race does not have a winner until the race is closed' do 
    race1 = Race.new("Texas Governor")
    candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})

    expect(race1.winner).to be false
  end

  it 'race has a winner when the race is no longer open' do 
    race1 = Race.new("Texas Governor")
    candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})

    expect(race1.open?).to be true

    race1.close!

    expect(race1.open?).to be false  
  end
end