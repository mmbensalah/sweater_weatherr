class DarkSkyService
  attr_reader :lat,
              :lng
  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def get_weather
    to_json("/forecast/#{ENV["DARK_SKY_API"]}/#{lat},#{lng}")
  end

  private

  def to_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.darksky.net")
  end
end
