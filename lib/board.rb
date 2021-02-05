class Board

    attr_accessor :cells

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def reset!
        self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
        index
    end

    def position(input)
        index = input_to_index(input)
        self.cells[index]
    end

    def update(input, player)
        index = input_to_index(input)
        self.cells[index] = player.token
    end

    def taken?(input)
        index = input_to_index(input)
        self.cells[index] == "X" || self.cells[index] == "O"
    end

    def valid_move?(input)
        index = input_to_index(input)
        self.taken?(input) == false && index >= 0 && index <= 8 
    end
    
    def full?
        if self.cells.any?(" ")
            false
        else
            true
        end
    end

    def turn_count
        self.cells.count("X") + self.cells.count("O")
    end

end