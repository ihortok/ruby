# LESSON 2
# task 1
# turn string like 'var_test_text' into 'varTestText'

def remove_lower_underline(str)
  return 'string is empty' if str.empty?

  str_to_array = str.to_s.downcase.split('_')
  srt_camel_case = str_to_array[0]
  str_to_array.each_with_index do |el, i|
    srt_camel_case << el.capitalize unless i.zero?
  end
  srt_camel_case
end

puts remove_lower_underline('var_test_text_aaBB')

# task 2
# reverse a string saving an order of words

def string_reverse(str)
  return str.to_s.reverse! unless str.to_s.include? ' '

  str_to_array = str.to_s.split(' ')
  str_to_array.each(&:reverse!)
  str_to_array.join(' ')
end

puts string_reverse('ячс asd hJk')

# task 4-5
# display only those elements of an array that have '3' in it
# count how many '3' has an array

# class which methods work with array
class ArrayProccesor
  def includes_character?(array, char)
    return 'wrong parameters' unless array.is_a? Array

    array.select { |e| e.to_s.match(/#{char}/) }
  end

  def count_characters(array, char)
    return 'wrong parameters' unless array.is_a? Array

    array.to_s.count(char.to_s)
  end
end

ArrayProccesorObj = ArrayProccesor.new
puts ArrayProccesorObj.includes_character?([123, 434, 653_735, 34, 65], 3)
puts ArrayProccesorObj.count_characters([123, 3434, 653_735, 34, 65], 3)

# BONUS TASKS
# bonus task 1
# modify a string in the next way:
# 'The' + a string with first letter capitalized. However, when
# a string STARTS and ENDS with the same letter:
# repeat a string twice and connect them together
# with the first and last letter,
# combined into one word like so (WITHOUT a 'The' in front):
# dolphin -> The Dolphin
# alaska -> Alaskalaska
# europe -> Europeurope

def band_name(name)
  return name.to_s.capitalize << name.to_s[1..-1] if name[0] == name[-1]

  article = 'The'
  article << ' ' << name.to_s.capitalize
end

puts band_name('alaska')
puts band_name('dolphin')

# bonus task 2
# We have chars mapping: A => T, C => G.
# You need to create a converter for strings with the results:
# 'ATTGC' -> returns 'TAACG', 'GTAT' -> returns 'CATA'

def chars_mapping(str, map = {})
  return 'incorrect map' unless map.is_a? Hash

  str_to_array = str.to_s.upcase.split('')
  map.keys.each do |key|
    str_to_array.each_with_index do |value, index|
      case value
      when key then str_to_array[index] = map[key].upcase
      when map[key] then str_to_array[index] = key.upcase
      end
    end
  end
  str_to_array.join('')
end

puts chars_mapping('attgc', 'A' => 'T', 'C' => 'G')
puts chars_mapping('gTAT', 'A' => 'T', 'C' => 'G')
puts chars_mapping('attgc', 'sd')
