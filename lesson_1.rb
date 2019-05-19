# LESSON 1
# task 1
# add 2 strings 'text1' and 'text2'

def add_strings(text1, text2)
  text1.to_s + ' ' + text2.to_s
end

puts add_strings('hello', 'World')

# task 2
# display letters 'h', 'e' and 'o' if exists in a string

def display_letters(srt)
  if(!srt.is_a? String)
  	return 'incorect number'
  end
  puts srt.split('').select { |e| e == 'h' || e == 'e' || e == 'o' }
end

display_letters('hello')

# task 3
# display true if num > 0 and num < 5

def check_num(num)
  (num.is_a? Integer) && num.positive? && num < 5
end

puts check_num(3)

# task 4
# define to which part of a day a minute belongs to

def day_part(min)
  if(!min.is_a? Integer)
  	return 'incorect number'
  end
  case min % 59
  when 0..14
    '1-st part'
  when 15..29
    '2-nd part'
  when 30..44
    '3-st part'
  when 45..59
  	'4-st part'
  end
end

puts day_part(15)

# task 5
# check if a year is a leap year

def is_leap_year(year)
  return 'incorect year' if (!year.is_a? Integer)
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end

puts is_leap_year(2100)

# task 5
# check if number with 6 digits sum of left 3 digits is equel to right 3 digits

def has_equel_parts(num)
  if((!num.is_a? Integer) || num.to_s.length != 6)
    return 'incorect number'
  end
  left_part = num.digits[0..2].reduce { |sum,e| sum += e }
  right_part = num.digits[3..6].reduce { |sum,e| sum += e }
  left_part == right_part
end

puts has_equel_parts(123321)

# BONUS TASK
# Compare two strings by comparing the sum of their values (ASCII character code).
# For comparing treat all letters as UpperCase.
# Null-Strings should be treated as if they are empty strings.
# If the string contains other characters than letters, treat the whole string as it would be empty.
