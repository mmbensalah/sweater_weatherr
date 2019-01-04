class GiphyFacade
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def gif_objects
    gif_data.map do |gif|
      Gif.new(gif[:data][0][:url])
    end
  end

  def gif_data #gives giphy api data for gifs based on summary
    daily_gif = []
    daily_summary.map do |summary|
      GiphyService.new.get_gifs(summary)
    end.map do |data|
      data[:data].map do |gif|
        daily_gif << gif[:url]
      end
    end
  end

  def daily_summary
    daily_summary = []
    daily_data.map do |day|
      daily_summary << day[:summary]
      binding.pry
    end
  end

  def daily_time
    daily_time = []
    daily_data.map do |day|
      daily_time << day[:time]
    end
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
