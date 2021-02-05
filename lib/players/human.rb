module Players

    class Human < Player

        def move(board)
            puts "what you wanna do?"
            move = gets.chomp
        end

    end

end