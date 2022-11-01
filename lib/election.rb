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
    candidates = races.map do |race|
      race.candidates
    end
    candidates.flatten
  end

  def vote_counts
    votes = {}
    candidates.each do |candidate|
      votes["#{candidate.name}".to_s] = candidate.votes
    end
    votes
  end
end
