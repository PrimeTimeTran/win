# Write a method that takes in a string. Return the longest word in
# the string. You may assume that the string contains only letters and
# spaces.
#
# You may use the String `split` method to aid you in your quest.
#
# Difficulty: easy.

def longest_word(sentence)
  sentence = sentence.split(' ')
  longest_word = sentence[0]
  idx = 0
  while sentence.count > idx
    longest_word.size > sentence[idx].length ? longest_word : longest_word = sentence[idx]
     idx += 1
  end
  p longest_word
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('longest_word("short longest") == "longest": ' + (longest_word('short longest') == 'longest').to_s)
puts('longest_word("one") == "one": ' + (longest_word('one') == 'one').to_s)
puts('longest_word("abc def abcde") == "abcde": ' + (longest_word('abc def abcde') == 'abcde').to_s)
puts('longest_word("This question is protected to prevent") == "protected": ' + (longest_word('This question is protected to prevent') == 'protected').to_s)
