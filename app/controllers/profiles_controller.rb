class ProfilesController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to "/"
    end

    @profiles = Profile.all
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
  end

  def update
  end
end
