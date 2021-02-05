module Players
    class Computer < Player

        def move(board)
            move = nil
            Game::WIN_COMBINATIONS.each do |combination|
                if  combination.one?{|position| board.cells[position] == " "}
                move = combination.index(" ") + 1
                elsif combination.one?{|position| board.cells[position] == self.token}
                move = combination.index(" ") + 1
                elsif board.cells[4] != self.token
                move = 5
                else
                move = board.cells.index(" ") + 1
                end
            end
            move.to_s
        end
         

        

    end

end