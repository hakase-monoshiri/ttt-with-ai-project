module Players

    class Human < Player

        def move(board)
            board.display
            puts "what you wanna do?"
            move = gets.chomp
        end

    end

end