require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do 
  let!(:election) {Election.new('2022')}

  it 'each election has a year' do 

    expect(election.year).to eq('2022')
  end
end