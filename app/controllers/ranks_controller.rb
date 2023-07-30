class RanksController < ApplicationController
  def index
    @ranks = RanksQuery.call(limit: 10, min_points: 10)
  end
end