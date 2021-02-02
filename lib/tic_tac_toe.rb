require 'pry'

class TicTacToe
attr_reader :board

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def initialize
        @board = []
        9.times { @board << " " }
        puts " 1 | 2 | 3 "
        puts " ---------- "
        puts " 4 | 5 | 6 "
        puts " ---------- "
        puts " 7 | 8 | 9 "
    end

    def input_to_index(string)
        number = string.to_i
        index = number - 1
    end 

    def position_taken?(index)
        if self.board[index] == "X" || self.board[index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(position)
        if !self.position_taken?(position) && position.between?(0,8) 
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
       self.board[index] = token
    end

    def display_board
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
        puts " ----------- "
        puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
        puts " ----------- "
        puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def turn
        puts "Please make your move by choosing a number 1-9"
         input = gets
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)     
        else
             turn
         end  
         display_board       
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            if self.position_taken?(combo[0]) && self.board[combo[0]] == self.board[combo[1]] && self.board[combo[0]] == self.board[combo[2]]
                return combo
            end
        end
        if self.turn_count == 9
            return false
        end
    end

    def full?
        if 
        self.turn_count == 9
        true
        end
    end

    def draw?
        if !self.won? && self.full?
            true
        else
            false
        end 
    end

    def over?
        if self.won? || self.draw?
            true 
        else
            false
        end
    end

    def winner
        person = self.won?
        if person 
            self.board[person[0]]
        else
            nil
        end 
    end

    def play
        until over?
            turn
        end
    
        if self.winner 
            puts "Congratulations #{self.winner}!"
        else 
            puts "Cat's Game!"
        end
    end  
end