class Candidate
  attr_reader :name,
              :party,
              :votes

  def initialize(data)
    @name = data[:name]
    @party = data[:party]
    @votes = 0
  end

  def vote_for!
    @votes += 1
  end
end
