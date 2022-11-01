require 'pry'
require './lib/candidate'

class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(candidate_info)
    new_candidate = Candidate.new(candidate_info)
    @candidates << new_candidate
    new_candidate
  end

end
