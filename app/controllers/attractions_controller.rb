class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @user = User.find(session[:user_id])

    if @user.admin? && @attraction.save
      redirect_to @attraction
    else
      render :index
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end