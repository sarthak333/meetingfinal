class SlotsController < ApplicationController
def form
end
def show
  @room=Room.find(params[:room_id])
  @slot=@room.slot.find(params[:slot_id])
end
def showUsers
  @room=Room.find(params[:room_id])
  @slot = @room.slot.find(params[:id])
end
def create

   @room = Room.find(params[:room_id])

   @slot = @room.slot.build(slot_params)
   if @slot.save
     redirect_to room_path(@room)
   else
     flash[:danger]=@slot.errors.full_messages.join('.')
      redirect_to room_path(@room)
   end
 end
  def destroy
   @room = Room.find(params[:room_id])
   @slot = @room.slot.find(params[:id])
   @slot.destroy
   redirect_to room_path(@room)
 end
 private
   def slot_params
     params.require(:slot).permit(:start, :stop, :name, :description)
   end
end
