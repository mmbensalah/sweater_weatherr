class HourlyWeather
  attr_reader :temp, :time, :icon

  def initialize(data)
    @temp = data[:temperature]
    @time = data[:time]
    @icon = data[:icon]
  end
end
