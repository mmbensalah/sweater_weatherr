require 'date'
class CurrentWeather
  attr_reader :forecast,
              :current_temp,
              :feels_like,
              :current_time,
              :humidity,
              :visibility ,
              :uv,
              :current_summary,
              :hourly,
              :daily,
              :id

  def initialize(data)
    @forecast         = data[:currently][:summary]
    @current_temp     = data[:currently][:temperature]
    @temp_high        = data[:daily][:data][0][:temperatureHigh]
    @temp_low         = data[:daily][:data][0][:temperatureLow]
    @feels_like       = data[:currently][:apparentTemperature]
    @current_time     = data[:currently][:time]
    @humidity         = data[:currently][:humidity]
    @visibility       = data[:currently][:visibility]
    @uv               = data[:currently][:uvIndex]
    @current_summary  = data[:currently][:summary]
    @hourly           = hour(data[:hourly][:data])
    @daily            = day(data[:daily][:data])
    @id               = id
  end

  def hour(hour_data)
    hour_data[0..7].map do |data|
      HourlyWeather.new(data)
    end
  end

  def day(daily_data)
    daily_data[0..4].map do |data|
      DailyWeather.new(data)
    end
  end

  def current_time
    DateTime.strptime(@current_time.to_s, '%s')
  end

  def humidity
    @humidity * 100
  end
end
