class Race
  attr_reader :office,
              :candidates,
              :status

  def initialize(office)
    @office     = office
    @candidates = []
    @status     = 'open'
  end

  def register_candidate!(data)
    candidate = Candidate.new(data)
    @candidates << candidate
    return candidate
  end

  def open?
    @status == 'open'
  end

  def close!
    @status = 'closed'
  end

  def tie?
    top = @candidates.max { |candidate| candidate.votes }
    list = @candidates.select { |candidate| candidate.votes == top.votes }
    list.count > 1 
  end

  def winner 
    return false if open?
    @candidates.sort_by { |candidate| -candidate.votes }.first
  end
end
