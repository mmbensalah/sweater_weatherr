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

  def gif_data #returns array of gif urls
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

  def daily_summary #returns array of summaries
    arr = []
    daily_data.map do |day|
      arr << day[:summary]
    end
    arr[0..7]
  end

  def daily_time #returns array of times
    arr = []
    daily_data.map do |day|
      arr << day[:time]
    end
    arr[0..7]
  end

  def daily_data
    data = DarkSkyService.new(lat,lng).get_weather[:daily][:data]
  end

  def lat
    GeocodeService.new(@location).get_lat
  end

  def lng
    GeocodeService.new(@location).get_lng
  end
end
