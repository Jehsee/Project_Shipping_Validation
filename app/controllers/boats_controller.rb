class BoatsController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to "/"
    end
    @boats = Boat.all
  end
  def show
    if !user_signed_in?
      redirect_to "/"
    end
    @boat = Boat.find(params[:id])
  end
  def new
    if !user_signed_in?
      redirect_to "/"
    end
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

  def edit
    if !user_signed_in?
      redirect_to "/"
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    
    #nillify boat_id field from jobs assigned to his boat
    @boat.jobs.each do |j|
      j.boat_id = nil
      j.save
    end

    @boat.destroy
    @profie = Profile.find(user_id: current_user.id)
    redirect_to(profile_path(@profile.id))
  end



  private
  def boat_params
    params.require(:boat).permit(:user_id, :name, :capacity, :cur_loc)
  end
end
