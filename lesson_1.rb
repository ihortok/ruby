# frozen_string_literal: true

# LESSON 1
# task 1
# add 2 strings with space between them

def add_strings(text1, text2)
  text1.to_s + ' ' + text2.to_s
end

puts add_strings('hello', 'World')

# task 2
# display letters 'h', 'e' and 'o' if exists in a string

def display_letters(srt)
  return 'incorect value' unless srt.is_a? String

  srt.split('').select { |e| e == 'h' || e == 'e' || e == 'o' }
end

puts display_letters('hello')

# task 3
# display true if num > 0 and num < 5

def check_num(num)
  (num.is_a? Integer) && num.positive? && num < 5
end

puts check_num(3)

# task 4
# define to which part of a day a minute belongs to

def day_part(min)
  return 'incorect minute' unless min.is_a? Integer

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

def leap_year?(year)
  return 'incorect year' unless year.is_a? Integer

  (year % 400).zero? || ((year % 400).zero? && year % 100 != 0)
end

puts leap_year?(2100)

# task 5
# check if number with 6 digits sum of left 3 digits is equel to right 3 digits

def equel_parts?(num)
  return 'incorect number' unless num.is_a? Integer

  left_part = num.digits[0..2].reduce { |sum, e| sum + e }
  right_part = num.digits[3..6].reduce { |sum, e| sum + e }
  left_part == right_part
end

puts equel_parts?(123_32)

# BONUS TASK
# Compare two strings by comparing the sum
# of their values (ASCII character code).
# For comparing treat all letters as UpperCase.
# Null-Strings should be treated as if they are empty strings.
# If the string contains other characters than letters,
# treat the whole string as it would be empty.

def ascii_sum(str)
  return nil if (!str.is_a? String) || str.empty?

  sum = 0
  str.each_char do |e|
    if (e =~ /[[:alpha:]]/) != 0
      sum = nil
      break
    end
    sum += e.upcase.ord
  end
  sum
end

def ascii_sum_equel?(str1, str2)
  ascii_sum(str1) == ascii_sum(str2)
end

puts ascii_sum_equel?('AD', 'BC')
puts ascii_sum_equel?('AD', 'DD')
puts ascii_sum_equel?('FG', 'gf')
puts ascii_sum_equel?('zz1', '')
puts ascii_sum_equel?('ZzZz', 'ffPFF')
puts ascii_sum_equel?('Zz2z', 'ffPF_F')
