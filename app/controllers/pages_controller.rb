class PagesController < ApplicationController
  def index
    @time = Time.now
  end

  def map
    unless signed_in?
      redirect_to root_url
    end
  end
end
