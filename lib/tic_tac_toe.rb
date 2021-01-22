require 'pry'

class TicTacToe
attr_reader :board

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def initialize
        @board = []
        9.times { @board << " " }
    end

    def input_to_index(string)
        number = string.to_i
        board_number = number - 1
    end 

    def position_taken?(index)
        if self.board[index] == "X" || self.board[index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(position)
        if self.board[position] && self.position_taken?(position) == false
            true
        else 
            false
        end
    end

    def turn_count
        self.board.find_all{|turn| turn == "X" || turn == "O"}.length
    end

    def current_player
        if self.turn_count.odd? == true
            return "O"
        else 
           return "X"
        end
    end
    
    def move(index,token = "X")
       self.board[index] = "#{token}"
    end

    def display_board
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
        puts " ----------- "
        puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
        puts " ----------- "
        puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def turn
        puts "What is you move?"
        move = gets
        index = self.input_to_index(move)
        if self.valid_move?(index) == true
            self.move(index, self.current_player)
            self.display_board
        else
            self.turn
        end         
    end

end