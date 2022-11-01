require 'rspec'
require './lib/candidate'

describe Candidate do
  let(:candidate) { Candidate.new({name: "Diana D", party: :democrat}) }
  describe '#initialize' do

    it 'is an instance of Candidate' do
      expect(candidate).to be_a Candidate
    end

    it 'stores the name' do
      expect(candidate.name).to eq('Diana D')
    end

    it 'stores the party' do
      expect(candidate.party).to eq(:democrat)
    end

    it 'stores a number of votes' do
      expect(candidate.votes).to eq(0)
    end
  end

  describe '#vote_for!' do
    it 'adds one to the vote counter' do
      candidate.vote_for!
      expect(candidate.votes).to eq(1)
      candidate.vote_for!
      expect(candidate.votes).to eq(2)
      candidate.vote_for!
      expect(candidate.votes).to eq(3)
    end
  end
end