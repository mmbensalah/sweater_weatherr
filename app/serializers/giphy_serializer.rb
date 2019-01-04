class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :summary, :time, :url
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
