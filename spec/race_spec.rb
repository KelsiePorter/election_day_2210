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
end