require './lib/candidate'

class Election
  attr_reader :year,
              :races,
              :candidates

  def initialize(year)
    @year = year 
    @races = []
    @candidates = []
  end

  def add_race(race)
    @races << race
  end

  def candidates 
    @races.select do |race|
      @candidates << race.candidates
    end
    @candidates.flatten! 
  end

  def vote_counts 
    vote_counts_per_candidate = {}
    @races.each do |race|
      race.candidates.each do |candidate|
        vote_counts_per_candidate[candidate.name] = candidate.votes
      end
    end
    vote_counts_per_candidate
  end

end
