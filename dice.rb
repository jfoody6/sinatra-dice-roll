# /dice.rb
#gem install rackup


#bundle install
#required tools
require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
  
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

#homepage catch-all
get("/") do
  #"Hello World"

"
<h1>Dice Roll</h1>
<h2>Available options for random dice rolls</h2>

<ul>
  <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
  <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
  <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
  <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
</ul>
"

end

#identify outputs for specific paths beyond homepage
get("/zebra") do
  "We must add a route for each path we want to support"
end

#tester for new additions without cancelling
get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

#2 6-sided dice
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

#GET /dice/2/10 (simulate two 10-sided dice)
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end 

#GET /dice/1/20 (simulate one 20-sided die)
get("/dice/1/20") do
  first_die = rand(1..20)
  sum = first_die

  outcome = "You rolled a #{first_die} for a total of #{sum}."

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end 

#GET /dice/5/4 (simulate five 4-sided dice)
get("/dice/5/4") do
  first_die = rand(1..4)
  die_two = rand(1..4)
  die_three = rand(1..4)
  die_four = rand(1..4)
  die_five = rand(1..4)
  sum = first_die + die_two + die_three + die_four + die_five

  outcome = "You rolled a #{first_die}, #{die_two}, #{die_three}, #{die_four}, and #{die_five} for a total of #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end 
