# LTC Ruby homework 1, 2/4/13
#   partner is Oscar
def getresponse
  while true do
    #times cookes will be zero if not an integer
    times_cooked = gets.chomp.to_i
    #break if times_cooked != 0
    if times_cooked != 0
      srand(times_cooked)
      return times_cooked
      break
    else   
      puts  'Please answer with a number.'
      print 'How many times have you cooked ' + fav_food + '? '
    end  
  end
end

puts  "\nWelcome to my Kooking Klass \n   I'm Chris"
print 'What is your favorite food to cook? '
#this value is passed to te next puts
favorite = 'hot dogs'
fav_food = gets.chomp
if fav_food  == favorite
  puts "\nWow! That is my favorites also!"
else
  puts 'I like ' + fav_food + ', but not as much as ' + favorite + '.'
end

print 'About how many times have you cooked ' + fav_food + '? '

# move the while loop to a method
#while true do
#  #times_cooked will be zero if answer not numeric
#  times_cooked = gets.chomp.to_i
#  break if times_cooked != 0
#  puts 'Please answer with a number.'
#  print 'How many times have you cooked ' + fav_food + '? '
#end
times_cooked = getresponse

ive_cooked = (rand(100) + 1).to_s
if ive_cooked == 1
  puts 'I\'ve only cooked ' + fav_food + ' once.'
else
  puts 'I\'ve cooked ' + fav_food + ' ' + ive_cooked + ' times.'
end
if ive_cooked.to_i  <  times_cooked
  puts 'I guess you like to cook more then I do.'
else
  puts "I must like cooking #{fav_food} more then you."
end