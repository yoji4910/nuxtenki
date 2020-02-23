require 'open-uri'
require 'json'
# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
ENV.each { |k, v| env(k, v) }
# config/schedule.rb
set :output, "log/cron_log.log"
set :environment, :development

# 1分毎にログを出力する
# every 1.day, at: '1:00 am' do
#   rake "get_weather:recover"
# end

every 1.minute do
  rake "get_weather:recover"
end
