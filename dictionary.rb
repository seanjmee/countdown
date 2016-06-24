# Method declarations
def dictionary (wordlist)
		puts "Generating dictionary..."
		ordered_word_list = Hash.new
		wordlist.each do |w| 
							ordered_word_list[w.chomp.chars.sort.join.to_s] = w.chomp.to_s 	 	
							end
		puts "Dictionary successfully created"
		return ordered_word_list
end

def match_words (user_input, d)
	#order the input string for comparison against ordered_word_list keys
	ordered_input = user_input.chars.sort.join.to_s

	#matching loop, where there is a hit - add the value for the key to the result set

	result_set = []

	d.each do |k, v|
		if  (k.length > 3) && (ordered_input.include? k) 
			result_set << v
		end
	end
	puts "Matches:"
	puts result_set
end

def display_message
	puts "This application takes a string of letters from the standard input, and returns a list of words which can be formed from those letters..."
	puts "Like Countdown..."
	puts "Please enter the string to match:"
	STDOUT.flush
end

# entry point for main program

# create the ordered_word_list from a word list file
d = dictionary (File.open('words2.txt'))

#get user input to match against

display_message

user_input = gets.chomp.downcase

# pass this input to match_words to generate the hits

match_words user_input, d





