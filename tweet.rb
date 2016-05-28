require 'twitter'

#カスタマーキー、アクセストークン指定
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

#tmpディレクトリ指定
dir = Dir.glob("/tmp_motion/**")

#ツイート
dir.each do |file|
  client.update_with_media(s.sample,open(file))
end

#削除
begin 
  dir.each do |file|
    File.unlink(file)
  end
rescue StandardError => ex
ensure
end

