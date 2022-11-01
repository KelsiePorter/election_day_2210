require 'pry'
require './lib/candidate'

RSpec.describe Candidate do
  let!(:diana) {Candidate.new({name: "Diana D", party: :democrat})}

  it 'candidate has a name' do 

    expect(diana.name).to eq("Diana D")
  end

  it 'candidate has a party affiliation' do 

    expect(diana.party).to eq(:democrat)
  end

end