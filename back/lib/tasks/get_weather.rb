namespace :get_weather do
  desc "DarkSky apiから天気情報を取得しDBに保存する"
  task recover: :environment do
    weather = Weather.new(rainy_percent: 22.2)
    weather.save
    logger = Logger.new 'log/get_weather.log'

    MEGURO_TODAY = "https://api.darksky.net/forecast/0ac2e828cd520754a49b314aa6b19aa0/35.6340,139.7158"
    begin
      responce = open(MEGURO_TODAY)
      parse_text = JSON.parse(response.read)
      # weather_params = {
      #   time: parse_text["daily"]["data"]["time"],
      #   summry: parse_text["daily"]["data"]["summry"],
      #   icon: parse_text["daily"]["data"]["icon"],
      #   rainy_percent: parse_text["daily"]["data"]["precipProbability"],
      #   humidity: parse_text["daily"]["data"]["humidity"],
      #   temperature_high: parse_text["daily"]["data"]["temperatureHigh"],
      #   temperature_low: parse_text["daily"]["data"]["temperatureLow"]
      # }
      weather = Weather.new(icon: '1122')
      weather.save!
    rescue => e
      logger.error "parse_textのなかみ: #{JSON.pretty_generate(parse_text)}"
      logger.error e
      logger.error e.backtrace.join("\n")
      next
    end
  end
end