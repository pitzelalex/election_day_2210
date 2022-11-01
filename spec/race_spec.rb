require 'rspec'
require './lib/race'

describe Race do
  let(:race) { Race.new("Texas Governor")}
  describe '#initialize' do
    it 'is and instance of Race' do
      expect(race).to be_a Race
    end

    it 'has a specified office' do
      expect(race.office).to eq("Texas Governor")
    end

    it 'can hold an array of candidates' do
      expect(race.candidates).to eq([])
    end

    it 'has a status' do
      expect(race.status).to eq('open')
    end
  end
  
  describe '#register_candidate!' do 
    it 'creates a Candidate and adds it to @candidates' do
      c1 = race.register_candidate!({name: "Diana D", party: :democrat})
      expect(race.candidates.last).to be_a Candidate
      expect(race.candidates.count).to eq(1)
      expect(race.candidates).to eq([c1])
      c2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(race.candidates.last).to be_a Candidate
      expect(race.candidates.count).to eq(2)
      expect(race.candidates).to eq([c1, c2])
    end
  end

  describe '#open?' do
    it 'returns a boolean based on status' do
      expect(race.open?).to be true 
    end
  end
    
  describe '#close!' do
    it 'sets the status to closed' do
      race.close!
        
      expect(race.status).to eq('closed')
      expect(race.open?).to be false
    end
  end

  describe 'tie?' do
    it 'checks for a tie' do
      c1 = race.register_candidate!({name: "Diana D", party: :democrat})
      c2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {c1.vote_for!}
      3.times {c2.vote_for!}
      expect(race.tie?).to be false
      c2.vote_for!
      expect(race.tie?).to be true
    end
  end

  describe '#winner' do
    it 'checks for a winner' do
      expect(race.winner).to eq false
      race.close!
      c1 = race.register_candidate!({name: "Diana D", party: :democrat})
      c2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {c1.vote_for!}
      4.times {c2.vote_for!}
      expect(race.winner).to eq(c1)
      c1.vote_for!
      expect(race.winner).to eq(c1)
    end
  end
end