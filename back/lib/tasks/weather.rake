namespace :weather do
  desc "DarkSky apiから天気情報を取得しDBに保存する"
  task get: :environment do
    logger = Logger.new 'log/weather.log'

    begin
      response = open(WEATHER::MEGURO_TODAY)
      parse_text = JSON.parse(response.read)
      rainy_percent = (parse_text["daily"]["data"][0]["precipProbability"] * 100).to_i
      humidity = (parse_text["daily"]["data"][0]["humidity"] * 100).to_i
      weather_params = {
        unix_time: parse_text["daily"]["data"][0]["time"],
        summary: parse_text["daily"]["data"][0]["summary"],
        icon: parse_text["daily"]["data"][0]["icon"],
        rainy_percent: rainy_percent,
        humidity: humidity,
        temperature_high: parse_text["daily"]["data"][0]["temperatureHigh"],
        temperature_low: parse_text["daily"]["data"][0]["temperatureLow"]
      }
      weather = Weather.new(weather_params)
      weather.save!
    rescue => e
      logger.error "parse_textのなかみ: #{JSON.pretty_generate(parse_text)}"
      logger.error e
      logger.error e.backtrace.join("\n")
      next
    end
  end
end
