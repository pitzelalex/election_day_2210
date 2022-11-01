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
end