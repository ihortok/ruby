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
