# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
]

def won?(board)
  puts "won?"
  empty_board = board.all? do |space|
    space == " "
  end
  if empty_board
    puts "returning false"
    return false
  end
  WIN_COMBINATIONS.each do |array|
    all_taken = position_taken?(board, array[0]) && position_taken?(board, array[1]) && position_taken?(board, array[2])
    if all_taken && board[array[0]] == board[array[1]] && board[array[0]] == board[array[2]]
      print "return array", array, "\n"
      return array
    end
  end
  puts "returning false"
  false
end

def full?(board)
  full_board = board.all? do |character|
    character == "X" || character == "O"
  end
end

def draw?(board)
  puts "draw?"
  if won?(board)
    puts "returning false"
    return false
  end
  puts "returning true"
  true
end

def over?(board)
  print "over?", board, "\n"
  if won?(board)
    puts "won true"
    return true
  end
  if draw?(board)
    puts "draw true"
    return true
  end
  puts "over-returning false"
  false #otherwise false--what's interfering here?
end

def winner(board)
  if won?(board)
    array = won?(board)
    return board[array[0]]
  end
end
