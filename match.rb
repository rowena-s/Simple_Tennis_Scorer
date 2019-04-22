class Match
  require './player'
  MIN_PTS_TO_WIN = 3
  PTS_DIFF = 2
  MIN_GAMES_TO_WIN = 6
  GAMES_DIFF = 2
  attr_reader :players, :tiebreak, :matchstate
  def initialize(player1, player2)
      @scores = ["0","15", "30","40"]
      @player1 = Player.new(player1)
      @player2 = Player.new(player2)
      @players = {player1 => @player1, player2 => @player2}
      @tiebreak = false
      @matchState = "inprogress"
  end

    def pointWonBy(player)
      @players[player].points +=1
      # move this logic to function
      if @player1.points > MIN_PTS_TO_WIN && (@player1.points - @player2.points >= PTS_DIFF)
        gameWonBy(@player1)
      elsif @player2.points > MIN_PTS_TO_WIN && (@player2.points - @player1.points >=PTS_DIFF)
        gameWonBy(@player2)
      end
      # move this logic to function
      # if score = 6-5, play to 7. if score goes to 7-6 play a tie-break
      # in a tiebreak - win by 7 or more points by a margin of 2
      if @player1.games >= MIN_GAMES_TO_WIN
        if @player2.games == 5
          @tiebreak = true
        else
          matchWon(player)
        end
      elsif @player2.games >= MIN_GAMES_TO_WIN
        if @player2.games == 5
          @tiebreak = true
        else
          matchWon(player)
        end
      end
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