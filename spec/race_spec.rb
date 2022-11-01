require './lib/candidate'
require './lib/race'

RSpec.describe Race do 
  let!(:race) {Race.new("Texas Governor")}

  it 'each race has an office' do 

    expect(race.office).to eq("Texas Governor")
  end

end