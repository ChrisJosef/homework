# LTC Ruby homework 2, 2/18/13
#   partner is ?

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

def cooking_class
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
end

def get_chapters(chapter_list)
  while true do
    chapter = gets.chomp.capitalize
    #break/return if nothing entered
    if chapter == nil
      return 
    end
    chapter_list << chapter
    #print "Chapter list so far \n" chapter_list.to_s
    #print "Next chapter is:" chapter  
  end
end

def angery_boss
puts  "\nAngry Boss \n  So what do you want THIS time!?"
puts "Ask a question."

favorite   = 'raise'
asking_for = gets.chomp.downcase
if asking_for  == favorite
  puts "\nWow! You actually think you deserve a #{asking_for.upcase}!!"
else
  puts 'NO! you can\'t have that. You\'re FIRED!'
end
end

def chapters
  puts ' '
  print 'Please enter the first chapter name: ' 
  
  #chapter_list = []
  chapter_list = {}
  #get_chapters(chapter_list)

  while true do
      chapter = gets.chomp.capitalize
      print 'inputed ' + chapter + "\n"
      #break/return if nothing entered
      if chapter == 'Quit' || chapter == 'Done' || chapter == 'End' 
        puts 'input done' + "\n"
        break
      end
      #chapter_list << chapter
      print 'page number: '
      page_no = gets.chomp
      puts 'inputed page:' + page_no.to_s
      #chapter_list.store(:page_no, chapter)
      chapter_list[page_no] = chapter
      print "Next chapter is:"   
  end

  puts 'chapter list hash: ' + chapter_list.to_s + "\n"

  i = 0
  chapter_list.each do |page, chap|
    i += 1
    #puts chap.center(line_length)
    print "Chapter " + i.to_s.ljust(5) + chap.center(Line_length) + '     page ' + page.to_s.rjust(4) + "\n"
  end
end

def chapters_file
  puts ' '
  print 'Reading the chapter names: ' 
  
  # no error checking!
  chapter_list = {}
  #get_chapters(chapter_list)

  File.open("chapter_list.txt", "r") do |file|
      while line = file.gets 
        puts "read: " + line 
        chap = line.split(';')
        chapter_no = chap[0]
        chapter = chap[1].lstrip.capitalize
        print 'inputed ' + chapter_no + "  " + chapter + "\n"
      #break/return if nothing entered
      if chapter == 'Quit' || chapter == 'Done' || chapter == 'End' 
        puts 'input done' + "\n"
        break
      end
      #chapter_list << chapter
      print 'page number: '
      page_no = chap[2]
      puts 'inputed page:' + page_no.to_s
      #chapter_list.store(:page_no, chapter)
      chapter_list[page_no] = chapter
      print "Next chapter is:"  
      end
  end

  #puts 'chapter list hash: ' + chapter_list.to_s + "\n"
  puts
  puts("Table of Contents".center(70)) 
  puts
  i = 0
  chapter_list.each do |page, chap|
    i += 1
    #puts chap.center(line_length)
    print "Chapter " + i.to_s.ljust(5) + chap.center(Line_length) + '     page ' + page.to_s.rjust(4) + "\n"
  end
end
#  MAIN LINE STARTS HERE ----------------------------------------------------

lesson_list = [ 'cooking', 'bottles of beer', 'angry boss', 'chapter list', 'chapter file' ]
lessons = lesson_list.length   #number of homeworks
print "\nBuffalo TLC homework\nEnter the 'Things to Try' number you want to run\n"
print "  homework 1: cooking class\n"
print "  homework 2: bottles of beer - did not do\n"
print "  homework 3: angry boss\n"
print "  homework 4: table of contents\n" 
print "  homework 5: table of contents - file input\n\n" 
print "Enter a number between 1 and #{lessons}: "
Line_length  = 25

while true
  try_class = gets.chomp.to_i
if try_class > 0 && try_class  <=  lessons
  break
else
  puts 'Invalid input. Try again.'
end
end

case try_class
when 1
  cooking_class
when 3
  angery_boss
when 4
  chapters
when 5
  chapters_file
else
  puts "Woops. Didn't write that one yet!"
end