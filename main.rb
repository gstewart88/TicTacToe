require 'pry-byebug'

require_relative 'game'
require_relative 'move'

puts `clear`
puts "Playing TTT..."

def expect(thing, other_thing)
  raise "#{thing} did not equal #{other_thing}" unless thing == other_thing
end

def print_board(g)
  puts(g.board.each_slice(3).map do |row|
    row.map { |e| e || ' ' }.join(' | ')
  end.join("\n---------\n"))
end

g = Game.new

puts "What is player 1's name? "
g.player1 = gets.chomp

puts "What is player 2's name? "
g.player2 = gets.chomp

until g.finished?
  puts `clear`
  puts print_board(g)
  puts "where's #{g.whose_turn}'s move?"
  g.make_move g.whose_turn, gets.to_i.abs
end

puts `clear`
puts print_board(g)
puts g.result