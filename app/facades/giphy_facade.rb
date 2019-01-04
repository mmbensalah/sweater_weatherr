class GiphyFacade
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def gif_objects
    zip.map do |data|
      Gif.new(data)
    end
  end

  def zip
    daily_summary.zip(daily_time, gif_data)
  end

  def gif_data #gives giphy api data for gifs based on summary
    arr = []
    daily_summary.map do |summary|
      GiphyService.new.get_gifs(summary)
    end.map do |data|
      data[:data].map do |gif|
        arr << gif[:url]
      end
    end
    arr[0..7]
  end

  def daily_summary
    arr = []
    daily_data.map do |day|
      arr << day[:summary]
    end
    arr[0..7]
  end

  def daily_time
    arr = []
    daily_data.map do |day|
      arr << day[:time]
    end
    arr[0..7]
  end

  def daily_data #array of summaries
    data = DarkSkyService.new(lat,lng).get_weather[:daily][:data]
  end

  def lat
    GeocodeService.new(@location).get_lat
  end

  def lng
    GeocodeService.new(@location).get_lng
  end
end
