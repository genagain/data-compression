require 'pry'

#the problem is I am adding the current character even

def select_operation(input)
  # input_array = input.split(" ")
  # operation = input_array.first
  # file_name = input_array.last

end


def write_to_file(test_compressed, output)
  output.delete(nil)
  File.open(test_compressed, 'w') do |file|
    file.write(output.pack('U*'))
  end
end

def add_to_dictionary(dictionary, key)
  (dictionary.values.max < 256)? value = 255  : value = dictionary.values.max
  if dictionary.key?(key)
    current_char = key
  else
    value += 1
    dictionary[key] = value
    current_char = ''
  end
  current_char
end

def calc_bit_length(dictionary)
  max_value = dictionary.values.max
  n = Math.log(max_value,2)
  bit_length = n.floor + 1
end

def inital_dictionary
  {
    '\n' => 10,
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
end

def compress_file()
  test_input = 'the_last_question.txt'
  start_size = File.size(test_input)

  puts "Start size: #{start_size}"
  test_compressed = test_input + '.compressed'
  file = File.open(test_input)
  input = file.read
  dictionary = inital_dictionary

  i = 0
  current_char = input[0]
  output = []

  input.each_char.with_index do |char, i|
    current_char += char if current_char == ''
    key = current_char + input[i + 1] unless input[i + 1].nil?
    if !(dictionary.key?(key)) || input[i + 1].nil?
      output << dictionary[current_char]
    end
    current_char = add_to_dictionary(dictionary, key)

    i += 1
  end
  write_to_file(test_compressed, output)
  finish_size = File.size(test_compressed)
  puts calc_bit_length(dictionary)
end

def decompress()
  decompress_file = "the_last_question.txt.compressed"
  packed_input = File.open(decompress_file)
  unpacked_input = packed_input.unpack("U*")
  

end

input = 'thisisthe'
# input = ARGV.join(" ")
compress_file()
