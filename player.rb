class Player
  attr_accessor :points, :games
  attr_reader :name
  def initialize(name)
    @points = 0
    @games = 0
    @name = name
  end

  def wonGame? (otherPlayerPts)
    #put logic to test if player has won a game
  end  

  def wonSet? (otherPlayerGames)
   #put in logic to test if play has won the set
  end  
end