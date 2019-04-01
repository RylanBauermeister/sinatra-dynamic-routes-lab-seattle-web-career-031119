require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    name = params[:name]
    "#{name.reverse}"
  end

  get '/square/:number' do
    number = params[:number]
    "#{number.to_i**2}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    erb :say_num_times
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @final_string = ""
    @params.each do |param, value|
      @final_string += value.gsub("\n",  "") + " "
    end
    @final_string.strip!
    @final_string += "."
    erb :five_words
  end

  get '/:operation/:number1/:number2' do
    a = params[:number1].to_i
    b = params[:number2].to_i

    case params[:operation]
    when 'add'
      "#{a+b}"
    when 'subtract'
      "#{a-b}"
    when 'multiply'
      "#{a*b}"
    when 'divide'
      "#{a/b}"
    end
  end
end
