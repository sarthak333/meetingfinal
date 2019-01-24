class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create

    @room = Room.new(room_params)

 if current_user.admin?
    if @room.save
    flash[:success] = "Room has been created successfully"
    render 'show'
    else
    render 'new'
    end
  else
    flash[:danger] = "Rooms can only be created by Admins."
    render 'new'
  end
  end

  private

    def room_params
      params.require(:room).permit(:name, :capacity)
    end
end
