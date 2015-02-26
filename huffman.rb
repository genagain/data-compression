# YOUR CODE GOES HERE
# start time
# read the file char by char
# calculate the the size of the file
# find the most common characters
# sort them from most to least common
# create a tree by combining the least common nodes together
# encode each character with the bit string
# calculate the file size
# calculate compression percentage and ratio
# output the results


# def count_chars(file_name)
#   File.read(file_name).chars.reduce(Hash.new(0)) { |counts, char| counts.merge(char) }
# end
#
# count_chars("some_file.txt")

def count_chars(file_name)
  # {|char, count|}
  char_count = Hash.new(0)
  File.open(file_name, 'r') do |f|
    f.each_char do |char|
      char_count[char] += 1
    end
  end
  char_count.sort_by { |char, count| count }
end

def compress_file(input)
  input_array = input.split(" ")
  operation = input_array.first
  file_name = input_array.last
  start_size = File.size?(file_name)
  chars_count_sorted= {}
  chars_count_sorted = count_chars(file_name)
  print chars_count_sorted
end
