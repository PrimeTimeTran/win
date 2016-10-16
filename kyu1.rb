
################################################################################################################################
#################################
###########
#########
######  
# Loi Tran
# 12/21/15
# App Practice

# Create a method partition that accepts a list and a block. It should return two arrays: the first, with all the elements 
# for which the given block returned true, and the second for the remaining elements.
# Here's a simple example:
# animals = ["cat", "dog", "duck", "cow", "donkey"]
# partition(animals){|animal| animal.size == 3}
#     #=> [["cat", "dog", "cow"], ["duck", "donkey"]]
# If you need help, here's a reference:

def partition(animal)
  i = 0
  size = []
  ignore = []
  while i < animal.length
  if animal[i].length == 3
    size << animal[i]
  else
    ignore << animal[i]
  end
    i+=1
  end
  print size
  print ignore
  return size
end

#                                                                                                                      #########
##                                                                                                                     #########
###                                                                                                                    #########
####                                                                                                                   #########
################################################################################################################################

Test:
animals = ["cat", "dog", "duck", "cow", "donkey"]
partition(animals){|animal| animal.size == 3}

################################################################################################################################
#################################
###########
#########
######  
# 
#
# Create a function that takes a number as an argument and returns a grade based on that number.
# Score Graden = 59.999
# Anything greater than 1 or less than 0.6  'F'
# 0.9 or greater  "A"
# 0.8 or greater  "B"
# 0.7 or greater  "C"
# 0.6 or greater  "D"


def grade(n)
fail = 60.0
skimby = 70.0
average = 80.0
decent = 90.0
ace = 100.1
  if n < fail
    grade = "F"
  elsif n < skimby
    grade = "D"
  elsif n < average
    grade = "C"
  elsif n < decent
    grade = "B"
  elsif n < ace
    grade = "A"
  else 
  puts "Please enter a valid value"
  end
  return grade
end


#                                                                                                                      #########
##                                                                                                                     #########
###                                                                                                                    #########
####                                                                                                                   #########
################################################################################################################################

Test:
n = 99.99
puts grade(n)
n = 81.2
puts grade(n)
n = 59.999
puts grade(n)
n = 10000
puts grade(n)

################################################################################################################################
#################################
###########
#########
######  
# 
#
# Given 2 strings, a and b, return a string of the form short+long+short, with the shorter string on the outside and the longer string on the inside. 
# The strings will not be the same length, but they may be empty (length0).
# For example:
# solution("1", "22") // returns "1221"
# solution("22", "1") // returns "1221"


def solution(string1, string2)

    if (string1.length == 0 || string2.length == 0)
        if string1.length == 0
          first = string1
          second = string2
        else string2.length == 0
          first = string2
          second = string1     
        end    
    end

    if string1.length > string2.length
      first = string2
      second = string1
     elsif string2.length > string1.length
      first = string1
      second = string2
     elsif
      puts "They're equal"
     end
      answer = first + second + first # Should return the concated strings.
    return answer
end

#                                                                                                                      #########
##                                                                                                                     #########
###                                                                                                                    #########
####                                                                                                                   #########
################################################################################################################################

Test:
puts solution("1", "22")
puts solution("22", "1")
puts solution("Outside", "masssivelylargersomuchgointothemiddle")
puts solution("backwards", "flip")

################################################################################################################################
#################################
###########
#########
######  
# 
#
# Define a new instance method on the Array class called second, which returns the second item in an array (similar to the way .first and .last work in Ruby).
# If there is no element with index 1 in the array, return nil in Ruby, or undefined in Javascript.

class Array
  attr_reader :name, :array
  def initialize(name)
    @name = name
    @array = []
  end

  def second(array)
    array 
    second = array[1]
    return second
   end
end

#                                                                                                                      #########
##                                                                                                                     #########
###                                                                                                                    #########
####                                                                                                                   #########
################################################################################################################################
Test: 
puts array.second(array)
array = [1, 22, 3]
puts array.second(array)
array = [31, 333, 3]
puts array.second(array)
array = [1, 4444, 32]
puts array.second(array)
array = [1, 55555, 3]
puts array.second(array)
array = [1, 61, 3]
puts array.second(array)

































































































































































































































































































































































































































































































































































































































































































































































































































































































