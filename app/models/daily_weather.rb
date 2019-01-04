class DailyWeather
  attr_reader :time,
              :icon,
              :rain_prob,
              :temp_low,
              :temp_high

  def initialize(data)
    @time          = DateTime.strptime(data[:time].to_s, '%s')
    @icon          = data[:icon]
    @rain_prob     = data[:precipProbability]
    @temp_low      = data[:temperatureLow]
    @temp_high     = data[:temperatureHigh]
  end
end
