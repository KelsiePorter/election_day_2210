class Candidate
  attr_reader :name,
              :party 

  def initialize(candinate_info)
    @name = candinate_info[:name]
    @party = candinate_info[:party]
  end

end
