class ProfilesController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to "/"
    end
  end

  def create
  end

  def show
    if !user_signed_in?
      redirect_to "/"
    end
    @profile = Profile.where(user_id: params[:id]).first
  end

  def destroy
  end

  def new
    if !user_signed_in?
      redirect_to "/"
    end
  end

  def edit
    if !user_signed_in?
      redirect_to "/"
    end
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    flash[:info] = "Profile Edited Successfully"
    redirect_to :back
  end

  private
  def profile_params
    params.require(:profile).permit(:user_id, :fname, :lname, :username)
  end
end
