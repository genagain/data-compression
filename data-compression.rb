require 'pry'

#the problem is I am adding the current character even

def compress_file(input)
  # input_array = input.split(" ")
  # operation = input_array.first
  # file_name = input_array.last
  # start_size = File.size?(file_name)

  test_input = 'text.txt'
  test_compressed = test_input + '.compressed'

  output_file = File.open(test_compressed, "w")
  dictionary = {
    ' ' => 32,
    '!' => 33,
    '"' => 34,
    '#' => 35,
    '$' => 36,
    '%' => 37,
    '&' => 38,
    '\'' => 39,
    '(' => 40,
    ')' => 41,
    '*' => 42,
    '+' => 43,
    ',' => 44,
    '-' => 45,
    '.' => 46,
    '/' => 47,
    '0' => 48,
    '1' => 49,
    '2' => 50,
    '3' => 51,
    '4' => 52,
    '5' => 53,
    '6' => 54,
    '7' => 55,
    '8' => 56,
    '9' => 57,
    ':' => 58,
    ';' => 59,
    '<' => 60,
    '=' => 61,
    '>' => 62,
    '?' => 63,
    '@' => 64,
    'A' => 65,
    'B' => 66,
    'C' => 67,
    'D' => 68,
    'E' => 69,
    'F' => 70,
    'G' => 71,
    'H' => 72,
    'I' => 73,
    'J' => 74,
    'K' => 75,
    'L' => 76,
    'M' => 77,
    'N' => 78,
    'O' => 79,
    'P' => 80,
    'Q' => 81,
    'R' => 82,
    'S' => 83,
    'T' => 84,
    'U' => 85,
    'V' => 86,
    'W' => 87,
    'X' => 88,
    'Y' => 89,
    'Z' => 90,
    '[' => 91,
    '\\' => 92,
    ']' => 93,
    '^' => 94,
    '_' => 95,
    '`' => 96,
    'a' => 97,
    'b' => 98,
    'c' => 99,
    'd' => 100,
    'e' => 101,
    'f' => 102,
    'g' => 103,
    'h' => 104,
    'i' => 105,
    'j' => 106,
    'k' => 107,
    'l' => 108,
    'm' => 109,
    'n' => 110,
    'o' => 111,
    'p' => 112,
    'q' => 113,
    'r' => 114,
    's' => 115,
    't' => 116,
    'u' => 117,
    'v' => 118,
    'w' => 119,
    'x' => 120,
    'y' => 121,
    'z' => 122,
    '{' => 123,
    '|' => 124,
    '}' => 125,
    '~' => 126
  }
  dictionary_value = 256
  i = 0
  current_char = ''
  change_char = nil
  while i < input.length

    if change_char
      next_char = input[i + 1]
    else
      current_char += input[i]
      next_char = input[i + 1]
    end

    key = current_char + next_char unless next_char.nil?

    unless dictionary.key?(key)
      open(test_compressed, 'a') { |f| f << dictionary[current_char] }
    end

    puts "Current: #{input[i]} Next: #{input[i+1]}"
    if dictionary.key?(key)
      current_char = key
      change_char = true
    else
      dictionary[key] = dictionary_value
      puts "Add to dictionary: #{key} => #{dictionary_value}"
      dictionary_value += 1
      current_char = ''
      change_char = false
    end
    i += 1
  end
end

input = 'thisisthe'
# input = ARGV.join(" ")
compress_file(input)
