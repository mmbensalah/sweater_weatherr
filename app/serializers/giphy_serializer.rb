class GiphySerializer
  include FastJsonapi::ObjectSerializer
  set_type :current_weather
  attributes :daily, :time

  def gifs
    binding.pry
    {gif_objects: make_gif

    }
  end

  def make_gif
    binding.pry
    WeatherFacade.new(object.location).gif_objects
  end
end

# def asteroid
#   {name: make_asteroid.name,
#    is_potentially_hazardous_asteroid: make_asteroid.is_potentially_hazardous_asteroid
#   }
# end
#
# def make_asteroid
#   f = FavoriteFacade.new(object.neo_reference_id).fave_asteroid
#   Asteroid.new(f)
# end
