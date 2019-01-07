require 'date'
class HourlyWeather
  attr_reader :temp, :time, :icon

  def initialize(data)
    @temp = data[:temperature]
    @time = DateTime.strptime(data[:time].to_s, '%s')
    @icon = data[:icon]
  end
end
