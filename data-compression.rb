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
  change_char = nil
  while i < input.length
    
    if change_char
      next_char = input[i + 1]
    else
      current_char += input[i]
      next_char = input[i + 1]
    end

    key = current_char + next_char unless next_char.nil?

    puts "Current: #{input[i]} Next: #{input[i+1]}"
    if dictionary.key?(key) == false
      dictionary[key] = dictionary_value
      puts "Add to dictionary: #{key} => #{dictionary_value}"
      dictionary_value += 1
      current_char = ''
      change_char = false
    else
      current_char = key
      change_char = true
    end
    i += 1
  end
  print dictionary
end

input = 'thisisthe'
# input = ARGV.join(" ")
compress_file(input)
