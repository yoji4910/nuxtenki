# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# config/schedule.rb
set :output, "log/cron_log.log"
set :environment, :development

# 1分毎にログを出力する
every 1.minute do
  command "echo 'バッチ完了'"
  rake "get_weather:recover"
end
