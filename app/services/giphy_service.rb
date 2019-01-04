class GiphyService
  attr_reader

  def initialize

  end

  def get_gifs(q)
    to_json("/v1/gifs/search?api_key=#{ENV["GIPHY_API"]}&q=#{q}")
  end

  private

  def to_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.giphy.com")
  end
end
