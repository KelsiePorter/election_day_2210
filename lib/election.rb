class Election
  attr_reader :year,
              :races

  def initialize(year)
    @year = year 
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates 
    candidates = []
    @races.select do |race|
      candidates << race.candidates
    end
    candidates.flatten! 
  end

end
