colors = ["r", "b", "g", "y"]
random_colors = colors.shuffle
gueses = 12

puts <<-RULES
--------------------------
O = wrong color and place
V = right color
W = right colour and place
Colors: #{colors} (red, blue, green, yellow)
Answer format: r b g y
--------------------------
RULES

puts "Do you want to be a code master(m) or code guesser(g)?"
choice = gets.chomp

board = Board.new(gueses, colors)
board.display_board
if choice == "g"
  loop do
    if board.gues == "end"
      break
    end
  board.display_board
  end
elsif choice == "m"
  board.change_code
  loop do
    if board.bot_gues == "end"
      break
    end
  board.display_board
  end
end