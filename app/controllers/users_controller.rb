class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    #@user = User.new
  end
  def addSlot
    user= User.find(params[:user_id])
user.update_column(:room_id, params[:room_id].to_i)
  user.update_column(:slot_id, params[:slot_id].to_i)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
