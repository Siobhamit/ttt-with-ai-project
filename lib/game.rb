class Game
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]
  

    attr_accessor :board
    attr_reader :player_1, :player_2

   

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    @board = board
    end

    def board
       @board
    end
 
    def player_1=(player_1)
        @player_1 = player_1
    end

    def player_1
        @player_1
    end

    def player_2
        @player_2
    end

    def player_2=(player_2)
        @player_2 = player_2
    end

    def current_player
        if a = self.board.cells.count(" ").even?  
             self.player_2 
        else self.player_1
        end
    end

    def won? 
        WIN_COMBINATIONS.each do |combination|
         d = self.board.cells[combination[0]]
         e = self.board.cells[combination[1]]
         f = self.board.cells[combination[2]]
         if d == e && e == f && d != " "
           return combination
         end
       end
   combination = false
     end

    def draw?
        self.board.full? && !self.won?
    end

    def over?
        self.draw? || self.won? 
       end
     

    def play
    self.turn until self.over?
   if self.draw?
      puts "Cat's Game!"
    end
   if self.won?
      puts "Congratulations #{self.winner}!"
   end
  end

  def winner
    return self.board.cells[self.won?[0]] if self.won?
  end

  def turn
    self.board.display
    current_player = self.current_player
    if
    self.board.update(position = current_player.move(self.board), current_player)
    else current_player.move(self.board)
    end
end


end