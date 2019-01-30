class SrecordsController < ApplicationController
  def new
end

def show
end
def create
srec=Slot.find(params[:slot_id])
user=User.find(params[:user_id])
pop=srec.currentPopulation
if srec.srecord.exists?(user_id: user.id)
flash[:danger]= "User Already Added"
redirect_back(fallback_location: root_path)
else
srec.update_column(:currentPopulation, (pop+1))
@srecord= srec.srecord.create(:user_id => params[:user_id])
@urecord= user.urecord.create(:slot_id => params[:slot_id])
flash[:success]= "User Added"
redirect_back(fallback_location: root_path)
end
end
end
