class DailySummary
  attr_reader  :summary

  def initialize(data)
    @summary = data[:summary]
  end
end
