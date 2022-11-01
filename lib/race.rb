class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(data)
    candidate = Candidate.new(data)
    @candidates << candidate
    return candidate
  end
end
