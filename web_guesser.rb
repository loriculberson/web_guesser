require 'sinatra'
require 'sinatra/reloader'

secret_num ||= rand(100)
guess_count = 0

get '/' do 
  message = ""
  guess = params['guess'].to_i
  guess_count += 1
  
  message =  guess_check(secret_num, guess, guess_count) if guess_count!= 1
  erb :index, :locals => {:secret_num => secret_num, :message => message, :guess_count => guess_count}

end

def guess_check(secret_num, guess, guess_count)
  case 
    when guess - secret_num > 5 then "Way too high!"
    when secret_num < guess then "Too high" 
    when secret_num - guess > 5 then "Way too low"
    when secret_num > guess then "Too low"
    when secret_num == guess && guess_count == 2 then "You are correct! And is took you #{guess_count-1} guess!"
    else
      "You are correct! And is took you #{guess_count-1} guesses!"
  end
end

