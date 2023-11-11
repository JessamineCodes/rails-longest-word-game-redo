require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    # this would get ten different letters, but doesn't allow for repeats
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
    @letters
  end

  def score
    @word = params['word']
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_response = URI.open(url).read
    word_parsed_response = JSON.parse(word_response)
    is_found = word_parsed_response["found"]
    word_array = @word.split('')
    is_contained = word_array.all?{|character| params['letters'].include?(character.upcase)}
    # set the total score to be same as session score, and if that doesn't yet exist default that to 0
    @total_score = session[:user_score] ||= 0
    if is_found && is_contained
      @word_score = @word.length
      @message = "You win! *Victory dance*"
      @total_score = session[:user_score] += @word_score
    elsif is_found
      @word_score = 0
      @message = "That's a valid word but it isn't made up of these letters - sowee"
    else
      @word_score = 0
      @message = "That's not a valid word! Bozo"
    end
    # raise
  end

end
