class HomeController < ApplicationController
  def index
    @communities = Community.all.limit(8)
  end
end
