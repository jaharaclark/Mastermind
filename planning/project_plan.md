# Project_Plan

## Things we need to get done:
 - write the README.md
 - create a runner that starts the game


## Things we have accomplished:



## Things we are unsure of:




### Components/Classes/Iterations that are necessary:
  - a timer that counts how long a person has been playing in minutes and seconds
  - a lot of gets.chomp capturing the input that the user gives us
    - a name input
    - a guess input
    - their choice between play, read instructions or quit
  - variables for the output based on the users input
     - a board
      - an array (variables?) to map the user's input to of like "RRBG" to a return board of something like ["R", "R", "B", "G"] for readability
  - Requirements:
    - guesses are case insensitive
    - 'c' or 'cheat' prints out the secret code
    - error message that tells the user their input is too long or too short
    - have an 'end game' message
    - have 'guess feedback' re: you've had this many turns and this many guesses
    - a loop continue the game if the user is incorrect