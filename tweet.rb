require 'twitter'
require 'date'

nowtime = Time.now

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
dir = Dir.glob("/tmp_motion/**").sort

#ツイート
dir.each_with_index do |file,i|
##p file
##if i == dir.length - 1  ##検知した最初の画像をツイート
  if i == dir.length - 1  ##検知した最初の画像をツイート
##if i == 0               ##ツイートの直前画像をツイート  
    client.update_with_media(s.sample,open(file))
##音声再生
#   system ('sudo aplay koe1.wav')
    if nowtime.hour >= 19 and nowtime.hour <= 21   
      system ('sudo aplay badswap.wav')
    elsif nowtime.hour >= 6 and nowtime.hour <= 8  
      system ('sudo aplay badswap.wav')
    else
      system ('sudo aplay koe1.wav')
    end
####print "OK1!\n"
  end
end

#削除
dir.each do |file|
  begin
    File.unlink(file)
####print "OK2!\n"
  rescue StandardError => ex
####print "err3!\n"
  ensure
####print "err4!\n"
  end
end

