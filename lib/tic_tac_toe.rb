

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
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

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
########################

    def input_to_index(user_input)
      user_input.to_i - 1
    end

    def position_taken?(index)
      @board[index] != " " && @board[index] != ""
    end


    def valid_move?(index)
      if index.between?(0,8) == true
        if position_taken?(index) == false
          return true
        else position_taken?(index) == true
        return false
        end
      else return false
      end
    end

    def move(index, current_player)
      @board[index] = current_player
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
      counter = 0

      @board.each do |turn|
        if turn == "X" || turn == "O"
          counter +=1
        end
      end
      counter
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination

        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        else
          false
        end
      end
      false
    end

    def full?
        @board.all? {|cell| cell == "X" || cell == "O"}
    end

    def draw?
      if full? == true && won? == false
        true
      else
        false
      end
    end

  def over?
      if full? || won? || draw?
        true
      else
        false
      end
    end

    def winner
      if won?
        win_combination = won?
          if @board[win_combination[0]] == "X"
            return "X"
          else
            return "O"
          end
        end
      end



    def play      
        until over?
          turn
        end

        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end
