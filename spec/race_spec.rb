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

    4.times {candidate1.vote_for!}
    1.times {candidate2.vote_for!}

    expect(race1.open?).to be true
  end
end