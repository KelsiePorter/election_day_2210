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

  it 'candidate submits their votes' do 

    expect(diana.votes).to eq(0)

    3.times {diana.vote_for!}

    expect(diana.votes).to eq(3)

    diana.vote_for!

    expect(diana.votes).to eq(4)
  end
end