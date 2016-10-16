################################################################################################################################
######
#####
####
###
##
#
# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
#
# In case of ties (see example below), choose the earliest (left-most)
# of the two indices. If no number in `arr` is larger than `arr[i]`,
# return `nil`.
# => 1

def nearest_larger(arr, idx)
#   diff = 1
#   while true
#     left = idx - diff
#     right = idx + diff
#       if (left>=0) && (arr[left] > arr[idx])
#         return left
#       elsif (right < arr.length) && (arr[right] > arr[idx])
#         return right
#       elsif (left < 0) && (right >= arr.length)
#         return nil
#       end
#     diff+=1
#   end
# end

################################################################################################################################

def answer

  describe "#nearest_larger" do
    it "handles a simple case to the right" do
      nearest_larger([2,3,4,8], 2).should == 3
    end

    it "handles a simple case to the left" do
      nearest_larger([2,8,4,3], 2).should == 1
    end

    it "treats any two larger numbers like a tie" do
      nearest_larger([2,6,4,8], 2).should == 1
    end

    it "should choose the left case in a tie" do
      nearest_larger([2,6,4,6], 2).should == 1
    end

    it "handles a case with an answer > 1 distance to the left" do
      nearest_larger([8,2,4,3], 2).should == 0
    end

    it "handles a case with an answer > 1 distance to the right" do
      nearest_larger([2,4,3,8], 1).should == 3
    end

    it "should return nil if no larger number is found" do
      nearest_larger([2, 6, 4, 8], 3).should == nil
    end

    it "should return the nearer of two greater numbers" do
      nearest_larger([2, 6, 9, 4, 8], 3).should == 2
    end
  end
end

################################################################################################################################
######
#####
####
###
##
#
# Write a function, `no_repeats(year_start, year_end)`, which takes a
# range of years and outputs those years which do not have any
# repeated digits.
#
# You should probably write a helper function, `no_repeat?(year)` which
# returns true/false if a single year doesn't have a repeat.
# => 2
#
#
def no_repeats(first_year, last_year)
  not_repeated =[]
  (first_year..last_year).each do |year|
    if (no_repeat?(year))
      not_repeated << year
    end
  end
  p not_repeated
end

def no_repeat?(year)
  chars_seen = []
  year.to_s.each_char do |char|
    return false if chars_seen.include?(char)
    chars_seen << char
  end
  return true
end


puts no_repeats(1000, 2000)
################################################################################################################################

def answer
    def no_repeats(year_start, year_end)
      no_repeats = []
      (year_start..year_end).each do |yr|
        no_repeats << yr if no_repeat?(yr)
      end
      no_repeats
    end
    def no_repeat?(year)
        chars_seen = []
        year.to_s.each_char do |char|
          return false if chars_seen.include?(char)
          chars_seen << char
        end
        return true
    end

    puts no_repeats(1991, 2015)

    describe "#no_repeats" do
      it "should return a no repeat year" do
        no_repeats(1234, 1234).should == [1234]
      end

      it "should not return a repeat year" do
        no_repeats(1123, 1123).should == []
      end

      it "should return only those years that have no repeated digits" do
        no_repeats(1980, 1987).should == [
          1980,
          1982,
          1983,
          1984,
          1985,
          1986,
          1987
        ]
      end
    end
end

################################################################################################################################
######
#####
####
###
##
#
# Write a function, `letter_count(str)` that takes a string and
# returns a hash mapping each letter to its frequency. Do not include
# spaces.
# => 3

# def letter_count(str)
#   counts = Hash.new(0)
#   str.each_char do |char|
#     counts[char] += 1 unless char == " "
#   end
#   counts
# end
#
#
# ################################################################################################################################
#
# def answer
#   def letter_count(str)
#     counts = Hash.new(0)
#     str.each_char do |char|
#       counts[char] += 1 unless char == " "
#     end
#     counts
#   end
#
#
#   puts letter_count("hello")
#   puts letter_count("beginning")
#   puts letter_count("Hello")
#   puts letter_count("EEEEEEEverything")
# end

################################################################################################################################
######
#####
####
###
##
#
# Write a method, `ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).
#
# You will probably want a helper method, `ordered_vowel_word?(word)`
# which returns true/false if a word's vowels are ordered.
# => 4

# def ordered_vowel_words(str)
#   words = str.split(" ")
#
#   ordered_vowel_words = words.select do |word|
#     ordered_vowel_word?(word)
#   end
#
#   ordered_vowel_words.join(" ")
# end
# def ordered_vowel_word?(word)
#   vowels = ["a", "e", "i", "o", "u"]
#
#   letters_arr = word.split("")
#   vowels_arr = letters_arr.select { |l| vowels.include?(l) }
#
#   (0...(vowels_arr.length - 1)).all? do |i|
#     vowels_arr[i] <= vowels_arr[i + 1]
#   end
# end
#
# ################################################################################################################################
#
# def answer
#   def ordered_vowel_words(str)
#     words = str.split(" ")
#
#     ordered_vowel_words = words.select do |word|
#       ordered_vowel_word?(word)
#     end
#       ordered_vowel_words.join(" ")
#   end
#   def ordered_vowel_word?(word)
#     vowels = ["a", "e", "i", "o", "u"]
#
#     letters_arr = word.split("")
#     vowels_arr = letters_arr.select { |l| vowels.include?(l) }
#
#     (0...(vowels_arr.length - 1)).all? do |i|
#       vowels_arr[i] <= vowels_arr[i + 1]
#     end
#   end
#
#   puts ordered_vowel_words("tamely")
#   puts ordered_vowel_words("this is a test of the vowel ordering system")
#
#   describe "#ordered_vowel_words" do
#     it "returns a word that is in order" do
#       ordered_vowel_words("amends").should == "amends"
#     end
#
#     it "does not return a word that is not in order" do
#       ordered_vowel_words("complicated").should == ""
#     end
#
#     it "handles double vowels" do
#       ordered_vowel_words("afoot").should == "afoot"
#     end
#
#     it "handles a word with a single vowel" do
#       ordered_vowel_words("ham").should == "ham"
#     end
#
#     it "handles a word with no vowel" do
#       ordered_vowel_words("crypt").should == "crypt"
#     end
#
#     it "handles a word with a single letter" do
#       ordered_vowel_words("o").should == "o"
#     end
#
#     it "ignores the letter y" do
#       ordered_vowel_words("tamely").should == "tamely"
#     end
#
#     it "processes a string with several words" do
#       phrase = "this is a test of the vowel ordering system"
#       result = "this is a test of the system"
#
#       ordered_vowel_words(phrase).should == result
#     end
#   end
# end

################################################################################################################################
######
#####
####
###
##
#
# Catsylvanian money is a strange thing: they have a coin for every
# denomination (including zero!). A wonky change machine in
# Catsylvania takes any coin of value N and returns 3 new coins,
# valued at N/2, N/3 and N/4 (rounding down).
#
# Write a method `wonky_coins(n)` that returns the number of coins you
# are left with if you take all non-zero coins and keep feeding them
# back into the machine until you are left with only zero-value coins.
#
# Difficulty: 3/5
# => 5



################################################################################################################################

# def answer
#   def wonky_coins(n)
#     return 1 if n == 0
#
#     # call wonky_coins from inside itself. This is called *recursion*.
#     return wonky_coins(n / 2) + wonky_coins(n / 3) + wonky_coins(n / 4)
#   end
#
#   describe "#wonky_coins" do
#     it "handles a coin of value 1" do
#       wonky_coins(1).should == 3
#     end
#
#     it "handles a coin of value 5" do
#       wonky_coins(5).should == 11
#       # 11
#       # => [2, 1, 1]
#       # => [[1, 0, 0], [0, 0, 0], [0, 0, 0]]
#       # => [[[0, 0, 0], 0, 0], [0, 0, 0], [0, 0, 0]]
#     end
#
#     it "handles a coin of value 6" do
#       wonky_coins(6).should == 15
#     end
#
#     it "handles being given the zero coin" do
#       wonky_coins(0).should == 1
#     end
#   end
# end

################################################################################################################################
######
#####
####
###
##
#

# Build a function, `morse_encode(str)` that takes in a string (no
# numbers or punctuation) and outputs the morse code for it. See
# http://en.wikipedia.org/wiki/Morse_code. Put two spaces between
# words and one space between letters.
#
# You'll have to type in morse code: I'd use a hash to map letters to
# codes. Don't worry about numbers.
#
# I wrote a helper method `morse_encode_word(word)` that handled a
# single word.
#
# Difficulty: 2/5
# => 6


# MORSE_CODE = {
#   "a" => ".-",
#   "b" => "-...",
#   "c" => "-.-.",
#   "d" => "-..",
#   "e" => ".",
#   "f" => "..-.",
#   "g" => "--.",
#   "h" => "....",
#   "i" => "..",
#   "j" => ".---",
#   "k" => "-.-",
#   "l" => ".-..",
#   "m" => "--",
#   "n" => "-.",
#   "o" => "---",
#   "p" => ".--.",
#   "q" => "--.-",
#   "r" => ".-.",
#   "s" => "...",
#   "t" => "-",
#   "u" => "..-",
#   "v" => "...-",
#   "w" => ".--",
#   "x" => "-..-",
#   "y" => "-.--",
#   "z" => "--.."
# }
#
# def morse_encode(str)
#   words = str.split " "
#   encoded_words = words.map {|word| morse_encode_word(word) }
#   encoded_words.join " "
# end
# def morse_encode_word(word)
#   letters = word.split("")
#   back = letters.map {|letter| MORSE_CODE[letter]}
#   back.join " "
# end
#
# p morse_encode("I made this for you Khoi. With lots of love!")
#
# ################################################################################################################################
#
# def answer
#   def morse_encode(str)
#     words = str.split(" ")
#     encoded_words = words.map { |word| morse_encode_word(word) }
#     encoded_words.join("  ")
#   end
#   def morse_encode_word(word)
#     letters = word.split("")
#     codes = letters.map { |l| MORSE_CODE[l] }
#     codes.join(" ")
#   end
#
#   describe "#morse_encode" do
#   it "should do a simple letter" do
#     morse_encode("q").should == "--.-"
#   end
#
#   it "should handle a small word" do
#     morse_encode("cat").should == "-.-. .- -"
#   end
#
#   it "should handle a phrase" do
#     morse_encode("cat in hat").should == "-.-. .- -  .. -.  .... .- -"
#   end
#   end
# end

################################################################################################################################
######
#####
####
###
##
#
# Write a function word_unscrambler that takes two inputs: a scrambled
# word and a dictionary of real words.  Your program must then output
# all words that our scrambled word can unscramble to.
#
# Hint: To see if a string `s1` is an anagram of `s2`, split both
# strings into arrays of letters. Sort the two arrays. If they are
# equal, then they are anagrams.
#
# Difficulty: 3/5
# => 7

################################################################################################################################

def answer
  def word_unscrambler(str, words)
    str_letters = str.split("").sort

    anagrams = []
    words.each do |word|
      word_letters = word.split("").sort
      anagrams << word if str_letters == word_letters
    end

    anagrams
  end

  # This could also be written as a two-liner:

  def word_unscrambler(str, words)
    str_letters = str.split("").sort
    words.select { |word| str_letters == word.split("").sort }
  end

  # I've chosen to write it more explicitly for clarity to beginners.

#   describe "#word_unscrambler" do
#     it "handles a simple word" do
#       word_unscrambler("cat", ["tac"]).should == ["tac"]
#     end
#
#     it "does not inappropriately choose a word" do
#       word_unscrambler("cat", ["tom"]).should == []
#     end
#
#     it "handles a simple word from a larger dictionary" do
#       word_unscrambler("cat", ["tic", "toc", "tac", "toe"])
#         .should == ["tac"]
#     end
#
#     it "only handles words of the correct length" do
#       word_unscrambler("cat", ["scatter", "tac", "ca"] ).should == ["tac"]
#     end
#
#     it "handles multiple successful cases" do
#       word_unscrambler("turn", ["numb", "turn", "runt", "nurt"])
#         .should == ["turn", "runt", "nurt"]
#     end
#   end
# end

################################################################################################################################

# describe "#word_unscrambler" do
#   it "handles a simple word" do
#     word_unscrambler("cat", ["tac"]).should == ["tac"]
#   end
#
#   it "does not inappropriately choose a word" do
#     word_unscrambler("cat", ["tom"]).should == []
#   end
#
#   it "handles a simple word from a larger dictionary" do
#     word_unscrambler("cat", ["tic", "toc", "tac", "toe"])
#       .should == ["tac"]
#   end
#
#   it "only handles words of the correct length" do
#     word_unscrambler("cat", ["scatter", "tac", "ca"] ).should == ["tac"]
#   end
#
#   it "handles multiple successful cases" do
#     word_unscrambler("turn", ["numb", "turn", "runt", "nurt"])
#       .should == ["turn", "runt", "nurt"]
#   end
# end

################################################################################################################################
######
#####
####
###
##
#
# Write a function, `rec_intersection(rect1, rect2)` and returns the
# intersection of the two.
#
# Rectangles are represented as a pair of coordinate-pairs: the
# bottom-left and top-right coordinates (given in `[x, y]` notation).
#
# Hint: You can calculate the left-most x coordinate of the
# intersection by taking the maximum of the left-most x coordinate of
# each rectangle. Likewise, you can calculate the top-most y
# coordinate of the intersection by taking the minimum of the top most
# y coordinate of each rectangle.
#
# Difficulty: 4/5
# => 8
#
# ################################################################################################################################
#
# def answer
#   def rec_intersection(rect1, rect2)
#     x_min = [rect1[0][0], rect2[0][0]].max
#     x_max = [rect1[1][0], rect2[1][0]].min
#
#     y_min = [rect1[0][1], rect2[0][1]].max
#     y_max = [rect1[1][1], rect2[1][1]].min
#
#     return nil if ((x_max < x_min) || (y_max < y_min))
#     return [[x_min, y_min], [x_max, y_max]]
#   end
#   describe "#rectangle_intersection" do
#     it "handles a simple case" do
#       rec_intersection(
#         [[0, 0], [2, 1]],
#         [[1, 0], [3, 1]]
#       ).should == [[1, 0], [2, 1]]
#     end
#
#     it "returns the smaller rectangle if engulfed completely" do
#       rec_intersection(
#         [[1, 1], [2, 2]],
#         [[0, 0], [5, 5]]
#       ).should == [[1, 1], [2, 2]]
#     end
#
#     it "returns nil if there is no intersection" do
#       rec_intersection(
#         [[1, 1], [2, 2]],
#         [[4, 4], [5, 5]]
#       ).should == nil
#     end
#
#     it "handles a more complex case" do
#       rec_intersection(
#         [[1, 1], [5, 4]],
#         [[2, 2], [3, 5]]
#       ).should == [[2, 2], [3, 4]]
#     end
#
#   end
# end

################################################################################################################################
######
#####
####
###
##
#
# Write a function `bubble_sort(arr)` which will sort an array of
# integers using the "bubble sort"
# methodology. (http://en.wikipedia.org/wiki/Bubble_sort)
#
# Difficulty: 3/5
# => 9

################################################################################################################################

# def answer
#   def bubble_sort(arr)
#     sorted = false
#     until sorted
#       sorted = true
#       (arr.count - 1).times do |i|
#         if arr[i] > arr[i + 1]
#           arr[i], arr[i + 1] = arr[i + 1], arr[i]
#           sorted = false
#         end
#       end
#     end
#
#     arr
#   end
#   describe "#bubble_sort" do
#     it "works with an empty array" do
#       bubble_sort([]).should == []
#     end
#
#     it "works with an array of one item" do
#       bubble_sort([1]).should == [1]
#     end
#
#     it "sorts numbers" do
#       bubble_sort([5, 4, 3, 2, 1]).should == [1, 2, 3, 4, 5]
#     end
#   end
# end
# end
################################################################################################################################
