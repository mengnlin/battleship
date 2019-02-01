require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player 
    def initialize (n)
        @player=Player.new
        @board=Board.new(n)
        @remaining_misses=0.5*@board.size
    end 
    def start_game
        @board.place_random_ships 
        p @board.num_ships
        @board.print
    end 
    def lose? 
        if @remaining_misses<=0 
            p 'you lose'
            true 
        else  
            false 
        end  
    end  
    def win?
        if @board.num_ships ==0
            p 'you win'
            true 
        else  
             false 
        end  
    end   
    def game_over? 
        if win?|| lose?
            true 
        else  
            false   
        end 
    end 
    def turn  
        move=@player.get_move
        if @board[move]!=:S 
            @remaining_misses-=1  
        end  
        p @remaining_misses
        @board.attack(move)
        @board.print

    end 

end
