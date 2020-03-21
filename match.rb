class Match

  attr_reader :players, :tiebreak, :matchstate
  def initialize(player1, player2)
     # que of set sets with (player1, player2)
     sets_list = []
     sets_list.push(Set.new(player1, player2))

  end
  
    def pointWonBy(player)
      # call set.pointWonBy in here
      #if set finished, push new set onto list
    end  

    def getCurrentSet()
      return sets_list.last
    end


    def matchGames      
      return "#{@player1.games}-#{@player2.games}"
    end
    
    def matchWon(player)
      @matchState="finished"
      @players.each do |name,player|
        player.points = 0
        player.games = 0
      end 
    end

    def gameWonBy(player)
      player.games +=1
      @players.each do |name,player|
        player.points = 0
      end  
    end  
    
    def matchPoints
        if @player1.points >=3 && @player2.points>=3
          if @player1.points == @player2.points
            return "Deuce"
          else 
            return @player1.points > @player2.points ? "Advantage #{@player1.name}" : "Advantage #{@player2.name}"
          end
        end
        p1pts = @scores[@player1.points]
        p2pts = @scores[@player2.points]
        "#{p1pts}-#{p2pts}"
    end

    def score
      puts "#{matchGames}, #{matchPoints}"
    end
end