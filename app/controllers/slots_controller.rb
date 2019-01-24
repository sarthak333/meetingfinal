class SlotsController < ApplicationController
def form
end
def show
  @room=Room.find(params[:room_id])
  @slot = @room.slot.find(params[:id])
end
def showUsers
  @room=Room.find(params[:room_id])
  @slot = @room.slot.find(params[:id])
end
def create
   @room = Room.find(params[:room_id])
   @slot = @room.slot.create(slot_params)
   redirect_to room_path(@room)
 end
  def destroy
   @room = Room.find(params[:room_id])
   @slot = @room.slot.find(params[:id])
   @slot.destroy
   redirect_to room_path(@room)
 end
 private
   def slot_params
     params.require(:slot).permit(:start, :stop, :people)
   end
end
