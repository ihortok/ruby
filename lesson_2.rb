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
  return str.to_s.reverse! unless str.to_s.include? " "
  
  reversed_str = ''
  str_to_array = str.to_s.split(' ')
  str_to_array.each do |e|
    e = e.reverse!
  end
  str_to_array.join(' ')
end

puts string_reverse('ячс asd hJk')
