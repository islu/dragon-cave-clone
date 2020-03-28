class PublicController < ApplicationController
  def home
    @locations = Location.order(:name)
  end
end
