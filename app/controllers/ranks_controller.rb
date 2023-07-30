class RanksController < ApplicationController
  def index
    @ranks = RanksQuery.call(limit: 10)
  end
end