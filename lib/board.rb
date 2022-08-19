class Board
    attr_accessor :cells, :position
    attr_reader :token

    def initialize
        @cells = cells
        self.reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        print " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        print "-----------"
        print " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        print "-----------"
        print " #{cells[6]} | #{cells[7]} | #{cells[8]} "
      end

      def position(input)
        @cells[(input.strip.to_i - 1)]
      end

    def update(position, current_player)
        self.position(position).replace "#{current_player.token}" if self.valid_move?(position)
    end
    
    def turn_count
        @cells.count{|token| token == "X" || token == "O"}
    end
    
    def taken?(position)
        self.position(position) == " " ? false : true
    end
    
    def valid_move?(position)
        !taken?(position) && position.to_i.between?(1, 9)
    end
    
      def full?
       !@cells.include?(" ") 
      end
    
      


    end