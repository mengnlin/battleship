class Board
    attr_reader :size
    def self.print_grid (grid)
        grid.each do |row| 
            puts row.join(' ')
        end 
    end 
    def initialize(num)
        @grid=Array.new(num) {Array.new(num,:N)}
        @size=num*num
    end 
    def [](position)
        @grid[position[0]][position[1]]
    end 
    def []= (position,val)
        @grid[position[0]][position[1]]=val
    end 
    def num_ships
        @grid.flatten.count(:S)
    end 
    def attack(position)
        if self[position] == :S 
            self[position]=:H 
            p 'you sunk my battleship'
            true 
        else  
            self[position]=:X 
            false 
        end  
    end  
    def place_random_ships 
        total_ship=@size*0.25
        while self.num_ships < total_ship 
            positon_0=rand(0...@grid.length)
            positon_1=rand(0...@grid.length)
            position=[positon_0,positon_1]
            self[position] = :S 
        end  
    end 
    def hidden_ships_grid 
        @grid.map do |arr| 
            arr.map do |ele| 
                if ele==:S 
                    ele=:N  
                else  
                    ele=ele 
                end  
            end  
        end  
    end 

    def cheat 
        Board.print_grid(@grid)
    end 

    def print 
        Board.print_grid(hidden_ships_grid)
    end 

end
