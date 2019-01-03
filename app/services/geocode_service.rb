class GeocodeService
  attr_reader :address
  def initialize(address)
    @address = address
  end

  def get_coord
    to_json("/maps/api/geocode/json?address=#{@address}&key=#{ENV["GOOGLE_GEOCODE_API"]}")
  end

  private

  def to_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com')
  end
end
