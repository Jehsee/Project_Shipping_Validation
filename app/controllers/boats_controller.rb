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

    @new_follower = Follower.new
    @followers = Follower.where(boat_id: @boat.id)

    @names = []

    @followers.each do |f|
      @names << Profile.where(user_id: f.follower_id).first.full_name
    end
    
    @old_follower = Follower.where(follower_id: current_user.id, boat_id: @boat.id).first

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

    @boat = Boat.find(params[:id])
  end

  def update
    @boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to boat_path(@boat.id)
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
    params.require(:boat).permit(:user_id, :name, :capacity, :cur_loc, :avatar)
  end
end
