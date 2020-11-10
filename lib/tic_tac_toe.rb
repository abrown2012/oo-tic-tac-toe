class TicTacToe
    
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
  
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
  
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, token='X')
        @board[index] = token
        @board
    end

    def position_taken?(index)
        if @board[index] == 'X' || @board[index] == 'O'
            true
        else
            false
        end 
    end 

    def valid_move?(index)
        if position_taken?(index)
          false 
        elsif index < 9 && index >= 0 
          true
        else 
          false
        end 
    end 

    def turn 
      input = gets 
      index = input_to_index(input)
      if valid_move?(index)
        move(index, token=current_player())
        display_board
      else 
        input = gets 
      end 
    end 

    def won?
      if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        false
      elsif WIN_COMBINATIONS.each do |comb|
        if @board[comb[0]] == 'X' && @board[comb[1]] == 'X' && @board[comb[2]] == 'X'
          return comb 
        elsif @board[comb[0]] == 'O' && @board[comb[1]] == 'O' && @board[comb[2]] == 'O'
          return comb 
        end 
      end 
      else 
        false
      end 
    end

    def full?
      counter = 0 
      @board.all? do |element|
        element != ' '
      end 
    end 

    def draw?
      if full? && won? == nil 
        true
      else 
        false 
      end 
    end 
  
    def over?
      if won? || draw? || full?
        true
      else 
        false 
      end 
    end

    def winner
      if won?
        @board[won?[0]]
      end
    end

    def play 
      until over?
        turn
      end 

      if won?
        winner 
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      else over?
      end 
    end 
    
  end