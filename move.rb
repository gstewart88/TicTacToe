class Move
  attr_reader :square, :player, :symbol

  def initialize(player, square, symbol)
    @square = square
    @symbol = symbol
    @player = player
  end
end