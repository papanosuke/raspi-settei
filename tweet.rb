require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key          =  "3RlO6WyYwiwHEEy2SlSAgwfPA"
  config.consumer_secret       =  "PhfISYxBtSl61SerV7iQ4fthszvpf5IzrDJC4tAYSFx7PZDmkf"
  config.access_token          =  "136484894-2qyEsTEiLMfmlRQmbSpqXuaszvuwuPSVr9Xc5H83"
  config.access_token_secret   =  "GIoBkh5sYmsN72yUse6Z6GaebdV55IABJXoWRCanY0MdS"
end

s=[]
File.open("sentences.txt","r") do |l|
  l.each_line do |line|
    s.push(line)
  end
end
client.update_with_media(s.sample,open("/home/pi/a.png"))
