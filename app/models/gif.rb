class Gif
  attr_reader :url, :time, :summary, :id
  def initialize(data)
    @summary = data[0]
    @time    = data[1]
    @url     = data[2]
    @id      = id
  end
end
