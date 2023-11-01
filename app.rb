require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:sqrd_form)
end

get("/square/new") do
  erb(:sqrd_form)
end

get("/square/results") do
  @root = params.fetch("number").to_f
  @perfect = @root**2.0
  erb(:squarer)
end  

get("/square_root/new") do
  erb(:sqrt_form)
end  

get("/square_root/results") do
  @square = params.fetch("number").to_f
  @sq_root = @square**0.5
  erb(:sqrt)
end  

get("/payment/new") do
  erb(:finance_form)
end

get("/payment/results") do
  @principal = params.fetch("user_pv").to_i
  @years = params.fetch("user_years").to_i
  @apr = params.fetch("user_apr").to_f
  @rate = @apr/100/12
  @numer = @principal*@rate
  @periods = @years*12

  @denom = 1-((1+@rate)**-@periods)
  # @expo = -@periods
  # @oneplus = 1+@rate
  # @minus = @oneplus**@periods
  @minus = (1+@rate)**-@periods
  # @denom = 1-@minus
  @payment = @numer/@denom
  erb(:finance)
end  

get("/random/new") do
  erb(:random_form)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @ran_num = rand(@min..@max)
  erb(:random)
end
