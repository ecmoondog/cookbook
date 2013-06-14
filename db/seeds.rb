require 'nokogiri'
require 'open-uri'
require 'twilio-ruby'

# account_sid = '' add my sid
# auth_token = '' add my token
@client = Twilio::REST::Client.new account_sid, auth_token



["enchiladas", "applesauce", "peperonata"].each do |x|
  food = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/#{x}"))
  food_title = food.css("h1.entry-title")[0].content
  food_description = food.css(".recipe-description p")[0].content
  if Recipe.create(
    :title => "#{food_title}",
    :description => "#{food_description}"
    )
    @client.account.sms.messages.create(
      # :from => '+', add twilio number
      # :to => '+',  add personal number
      :body => "Hey there, your #{food_title} recipe was created with the seed file!"
    )
  end
end
