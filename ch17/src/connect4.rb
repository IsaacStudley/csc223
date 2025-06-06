def place(col, key, board) 
  for index in (0..5)  #check each part of the chosen column for a blank space then place it
    if board[index][col] == nil
      board[index][col] = key
      key = nil
    end
  end
end

def print_board(board)
  str = ""
  spot = ""
  for index in (0..5) # I think
    for col in (0..6) #
      spot = board[5-index][col]
      str += spot.nil? ? "[ ]" : "[#{spot}]"
     end
      str += "\n"
  end
    puts str
end

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

board = [
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
]


puts "Welcome to Connect 4!"
puts "Enter e to quit"
print_board(board)

loop do
  puts "Enter a single character piece to be placed"
  thing = gets.chomp
  break if thing == "e"
  while !(thing.length == 1) || thing == "e" do
    puts "Input Invalid: Enter a single character piece to be placed"
    thing = gets.chomp
    break if thing == "e"
  end
  break if thing == "e"
  puts "Choose column between 1 and 7"
  colm = gets.chomp
  break if colm == "e"
  if !colm.is_integer? && colm != "e"
    colm = 0
  end
  while !(7>= Integer(colm) && Integer(colm) >= 1) || colm == "e" do
    puts "Input Invalid: Choose column between 1 and 7"
    colm = gets.chomp
    break if colm == "e"
  end
  break if colm == "e"
  place(Integer(colm)-1, thing, board)
  print_board(board)
end



