require_relative '../match'
# test 6 - 1 40-0 should be p1 wins.

RSpec.describe Match do
  
  before(:each)  do 
    @match = Match.new("p1", "p2") 
  end 

  describe '#addpoint' do  
    context 'next point wins game p1 40-0' do
      before { @match.players["p1"].points = 3 }
      specify do
        @match.pointWonBy("p1")
        expect(@match.players["p1"].games).to eq 1
        expect(@match.players["p1"].points).to eq 0
        expect(@match.players["p2"].points).to eq 0
        # expect(self).to receive(pointWonBy).with("p1")
      end
    end

    context 'next point wins game p1 40-adv' do
      before do 
        @match.players["p1"].points = 4
        @match.players["p2"].points = 5
      end
      specify do
        @match.pointWonBy("p2")
        expect(@match.players["p2"].games).to eq 1
        expect(@match.players["p1"].points).to eq 0
        expect(@match.players["p2"].points).to eq 0
      end
    end

    context 'next point does not win game p1 40-adv' do
      before do 
        @match.players["p1"].points = 4
        @match.players["p2"].points = 5
      end
      specify do
        @match.pointWonBy("p1")
        expect(@match.players["p1"].games).to eq 0
        expect(@match.players["p2"].games).to eq 0
        expect(@match.players["p1"].points).to eq 5
        expect(@match.players["p2"].points).to eq 5
      end
    end

    context 'next point does not win game p1 40-adv' do
      before do 
        @match.players["p1"].points = 4
        @match.players["p2"].points = 5
      end
      specify do
        @match.pointWonBy("p1")
        expect(@match.players["p1"].games).to eq 0
        expect(@match.players["p2"].games).to eq 0
        expect(@match.players["p1"].points).to eq 5
        expect(@match.players["p2"].points).to eq 5
      end
    end

    context 'next point wins set' do
      before do
        @match.players["p1"].games = 5
        @match.players["p2"].points = 0
        @match.players["p1"].points = 3
        @match.players["p2"].points = 0
      end
      specify do
        @match.pointWonBy("p1")
        expect(@match.players["p1"].games).to eq 0
        expect(@match.players["p2"].games).to eq 0
        expect(@match.players["p1"].points).to eq 0
        expect(@match.players["p2"].points).to eq 0
      end
    end

    context 'next point goes to tiebreak' do
      before do
        @match.players["p1"].games = 6
        @match.players["p2"].points = 5
        @match.players["p1"].points = 3
        @match.players["p2"].points = 0
      end
      specify do
        @match.pointWonBy("p1")
        expect(@match.players["p1"].games).to eq 0
        expect(@match.players["p2"].games).to eq 0
        expect(@match.players["p1"].points).to eq 0
        expect(@match.players["p2"].points).to eq 0
        expect(@match.tiebreak).to be true
      end
    end

  end

  describe '#score' do

    context 'points score is 40-40' do
      before do 
        @match.players["p1"].points = 3
        @match.players["p2"].points = 3
      end 
      specify do
        expect{ @match.score }.to output("0-0, Deuce\n").to_stdout
      end
    end 

    context 'points score is 40- adv' do
      before do 
        @match.players["p1"].points = 4
        @match.players["p2"].points = 5
      end 
      specify do
        expect{ @match.score }.to output("0-0, Advantage p2\n").to_stdout
      end
    end

    context 'points score is adv-40' do
      before do 
        @match.players["p1"].points = 5
        @match.players["p2"].points = 4
      end 
      specify do
        expect{ @match.score }.to output("0-0, Advantage p1\n").to_stdout
      end
    end

    context 'game score is 1-0' do
      before do 
        @match.players["p1"].games = 1
        @match.players["p2"].games = 0
      end 
      specify do
        expect{ @match.score }.to output("1-0, 0-0\n").to_stdout
      end
    end

    context 'game score and points score' do
      before do 
        @match.players["p1"].games = 0
        @match.players["p2"].games = 1
        @match.players["p1"].points = 2
        @match.players["p2"].points = 0
      end 
      specify do
        expect{ @match.score }.to output("0-1, 30-0\n").to_stdout
      end
    end

  end
end

