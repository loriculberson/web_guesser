require 'sinatra'
require 'sinatra/reloader'

secret_num ||= rand(100)
guess_count = 0

get '/' do 
  message = ""
  guess = params['guess'].to_i
  guess_count += 1
  
  message =  guess_check(secret_num, guess) if guess_count!= 1
  erb :index, :locals => {:secret_num => secret_num, :message => message, :guess_count => guess_count}

end

def guess_check(secret_num, guess)
  case 
    when secret_num < guess then message = "Too high" 
    when secret_num > guess then message = "Too low"
    else "You are correct!"
  end
end

