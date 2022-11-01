class Candidate
  attr_reader :name,
              :party,
              :votes 

  def initialize(candinate_info)
    @name = candinate_info[:name]
    @party = candinate_info[:party]
    @votes = 0
  end

  def vote_for! 
    @votes += 1
  end
end
