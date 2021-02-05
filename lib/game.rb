class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0,1,2], #top row
        [3,4,5], #middle row
        [6,7,8], #bottom row
        [0,3,6], #left column
        [1,4,7], #middle column
        [2,5,8], #right column
        [0,4,8], #back diagonal
        [2,4,6] #front diagonal

    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end


    def current_player
        c = board.turn_count
        if c.even?
            player_1
        else
            player_2
        end
    end

    def previous_player
        c = board.turn_count
        if c.even? || c == 0
            player_2
        else
            player_1
        end
    end

    
    def turn
        move = current_player.move(self.board)
        if board.valid_move?(move)
            board.update(move, current_player)
        else
            turn
        end
    end

    def won?
        winning_combo = nil
      WIN_COMBINATIONS.each do |combination|
           if  combination.all?{|position| /[Xx]/ === board.cells[position]} || combination.all?{|position| /[Oo]/ === board.cells[position]}
            winning_combo = combination
            end
        end
        winning_combo
    end

    def winner 
        if won?
            board.cells[won?.first]
        end
    end

                
    def draw?
        if board.full? == true && won? == nil
            true
        else
            false
        end
    end

    def over?
        draw? || won?
    end

    def play
        board.display
        puts "You go first #{current_player}"
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end


  

end