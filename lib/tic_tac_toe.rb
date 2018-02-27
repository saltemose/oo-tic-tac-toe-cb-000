class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [1, 4, 7], [2, 4, 6], [0, 3, 6], [2, 5, 8]]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      index = input.to_i - 1
      index
    end

    def move(index, token = "X")
      @board[index] = token
    end

    def position_taken?(index)
      if @board[index] != "X" && @board[index] != "O"
        return false
      else true
      end
    end

    def valid_move?(index)
      if !position_taken?(index) && index.between?(0, 8)
        return true
      else false
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else turn
      end
    end

    def turn_count
     @board.count{|el| el == "X" || el == "O"}
    end

    def current_player
      if turn_count % 2 == 0
        return "X"
      else "O"
      end
    end

    def won?
      WIN_COMBINATIONS.each do |win_array|
        if @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[0])
          return win_array
        end
      end
      false
      end

    def full?
      @board.all?{ |token| token == "X" || token == "O" }
    end

    def draw?
      if full? && !won?
        return true
      elsif won?
        return false
      end
      false
    end

    def over?
      return true if full? || won? || draw?
    end

    def winner
      if win_array = won?
        @winner = @board[win_array[0]]
      end
    end

    def play
        while !over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end

end
