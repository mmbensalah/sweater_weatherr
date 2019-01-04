class DailyWeather
  attr_reader :time,
              :icon,
              :rain_prob,
              :temp_low,
              :temp_high

  def initialize(data)
    @time          = data[:time]
    @icon          = data[:icon]
    @rain_prob     = data[:precipProbability]
    @temp_low      = data[:temperatureLow]
    @temp_high     = data[:temperatureHigh]
  end
end
