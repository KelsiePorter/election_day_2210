require './lib/candidate'

class Race
  attr_reader :office,
              :candidates
  attr_accessor :open

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate_info)
    new_candidate = Candidate.new(candidate_info)
    @candidates << new_candidate
    new_candidate
  end

  def open? 
    @open
  end
end
