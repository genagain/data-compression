require 'pry'
def compress_file(input)
  # input_array = input.split(" ")
  # operation = input_array.first
  # file_name = input_array.last
  # start_size = File.size?(file_name)
  dictionary = {}
  dictionary_value = 256
  i = 0
  current_char = ''
  while i < input.length
    current_char += input[i]
    next_char = input[i + 1]
    key = current_char + next_char unless next_char.nil?

    puts "Current: #{input[i]} Next: #{input[i+1]}"
    if dictionary.key?(key) == false
      dictionary[key] = dictionary_value
      puts "Add to dictionary: #{key} => #{dictionary_value}"
      dictionary_value += 1
      current_char = ''
    else
      current_char = key
    end
    i += 1
  end
  print dictionary
end

input = 'thisisthe'
# input = ARGV.join(" ")
compress_file(input)
