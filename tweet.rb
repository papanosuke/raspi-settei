require 'twitter'

#カスタマーキー、アクセストークン指定
client = Twitter::REST::Client.new do |config|
  config.consumer_key          =  "zSIRStW5JxKswlIeed6bDQRM9"
  config.consumer_secret       =  "bwzVbHklgikNgfI0v5p9AE9GRMfQcvJbwm6yIwRw2rfusWl1aB"
  config.access_token          =  "736541229823856644-U0dl9JSCThlzccUHqtyBdLvzp146LdS"
  config.access_token_secret   =  "NbJBkd8AFaddQ8hA8umqJs7g5FXba17IV7SpCFTAgiOg8"
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
dir.each do |file|
  begin
    File.unlink(file)
  rescue StandardError => ex
  ensure
  end
end

