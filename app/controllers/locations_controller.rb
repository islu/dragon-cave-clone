class LocationsController < ApplicationController
  def new
    @location = Location.new
  end
  def create
    @location = Location.new
    if @location.save
      redirect_to root_path, notice: "new location!"
    else
      render :new
    end
  end
  def show
    @locations = Location.order(:name)
    @location = Location.find(params[:id])
  end

  private


end
