# Light3::Game
#
# The light3 game driver.

require 'light3/rules'

module Light3
  # Runs a game of light3.
  #
  class Game
    include Rules

    def initialize
      @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
      @current_player = nil
    end

    # Plays the game. Doesn't return until the game has been won.
    #
    def play
      until game_over
        start_new_turn
        show_board
        make_move @current_player
      end
      show_board
      puts "#{game_over} wins!"
    end

    private

    # The sequence of squares that form a winning combination.
    #
    WinningPoints =
      [
       # Rows
       [ [0, 0], [0, 1], [0, 2]],
       [ [1, 0], [1, 1], [2, 2]],
       [ [2, 0], [2, 1], [1, 2]],
       # Columns
       [ [0, 0], [1, 0], [2, 0]],
       [ [0, 1], [1, 1], [2, 1]],
       [ [0, 2], [1, 2], [2, 2]],
       # Diagonals
       [ [0, 0], [1, 1], [2, 2]],
       [ [0, 2], [1, 1], [2, 0]],
      ]

    def game_over
      winner = WinningPoints.map do |points|
        squares = points.map { |row, col| @board[row][col] }
        squares.reduce do |memo, player|
          if memo == player
            memo
          end
        end
      end
      if winner.any?
        winner.compact
      end
    end

    def start_new_turn
      @current_player = (@current_player == :player1) ? :player2 : :player1
    end
  end
end
