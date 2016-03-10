class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end
  def show
    @boat = Boat.find(params[:id])
  end
  def new
    @boat = Boat.new
  end
  def create
    @boat = Boat.new(boat_params)
    @boat.save

    if @boat.save
      flash[:info] = "new boat created"
      redirect_to boat_path @boat.id
    else
      flash[:info] = "boat creation failed"
      render :back
    end
  end



  private
  def boat_params
    params.require(:boat).permit(:user_id, :name, :capacity, :cur_loc)
  end
end
