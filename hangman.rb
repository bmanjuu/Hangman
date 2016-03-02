key = ['F','L','A','T','I','R','O','N',' ','S','C','H','O','O','L']
player_view = ['_','_','_','_','_','_','_','_',' ','_','_','_','_','_','_'] #player's view of the words upon starting the game
incorrect_guesses = [] #this variable stores the user's incorrect guesses 
guesses = [" ",] #this variable stores all of the user's guesses, whether they are correct or incorroect. used to check against key array
hangman_stand = ["  |---| ", "  |     ", "  |     ", "  |     ", "  |     ", "__|_____"] 


def greeting
  puts "Let's play Hangman!"
end 

def beginning_stand(hangman_stand)
  hangman_stand.each do |draw|
    puts draw
  end
  puts "\n"
end  

def intro(player_view)
  puts "Here we have 2 words (14 letters total) that refer to a mind-blowingly awesome place to learn in New York."
  puts player_view.join(" ")
  puts "Let's begin!\n"
end 

def player_guess(incorrect_guesses, guesses)
  if incorrect_guesses.count < 6
    puts "Give me a letter!"
    guess = gets.chomp
    if guess.is_a? String 
      guess = guess.upcase
    else 
      until guess.class == String
        puts "Sorry, that is not a letter. Please enter a letter."
        guess = gets.chomp
      end 
    end
  elsif incorrect_guesses.count == 6
    puts "Last guess! What will it be?"
    guess = gets.chomp 
    guess = guess.upcase
  end
  guesses << guess 
end 

# def invalid_entry(guess)
#   until guess.class == String
#     puts "Sorry, that is not a letter. Please enter a letter."
#     guess = gets.chomp 
#   end
#   guess = guess.upcase 
# end 

def draw_hangman(hangman_stand, incorrect_guesses)
  case incorrect_guesses.count
    when 1
      hangman_stand[1] = "  |   O "
    when 2
      hangman_stand[2] = "  |   | "
    when 3
      hangman_stand[2] = "  |  \\| "
    when 4
      hangman_stand[2] = "  |  \\|/"
    when 5
      hangman_stand[3] = "  |   | "
    when 6
      hangman_stand[4] = "  |  /  "
    when 7
      hangman_stand[4] = "  |  / \\"
    else 
      puts "Whoohoo! You have another chance to guess again!"
  end
  hangman_stand
  hangman_stand.each do |draw|
    puts draw 
  end
  puts "\n" 
end 

def check_guess(key, player_view, incorrect_guesses, hangman_stand, guess = guesses.last)
  if key.include?(guess)
    key.each_with_index do |key_letter, letter_index|
      if key_letter == guess
        player_view[letter_index] = guess
      end
    end
    puts "Right on! That is correct! Let's keep going\n"
  else
    incorrect_guesses << guess
    puts "Sorry, that letter is incorrect."
    puts "Your guesses so far include: #{incorrect_guesses.join(", ")}. Try again!\n"
    draw_hangman(hangman_stand, incorrect_guesses)
  end
  puts player_view.join(" ")
  if player_view == key
    puts "Congrats!! #{key.join("")} is correct! Learn, Love, and Code on my friend!"
  elsif incorrect_guesses.count == 7
    puts "Oh no! The correct answer is #{key.join("")}. I insist you read more about them--you're missing out on some really cool people!" 
  end 
end 

def end_game
  puts "Thank you for playing Hangman! Have a great day! <3" 
end 

def play_hangman(player_view, key, hangman_stand, incorrect_guesses, guesses)
  greeting
  intro(player_view)
  beginning_stand(hangman_stand)
  until incorrect_guesses.count == 7 || player_view == key
    player_guess(incorrect_guesses, guesses)
    check_guess(key, player_view, incorrect_guesses, hangman_stand, guess = guesses.last)
  end 
  end_game
end 

play_hangman(player_view, key, hangman_stand, incorrect_guesses, guesses)