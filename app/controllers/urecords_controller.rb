class UrecordsController < ApplicationController
  def new
end

  def create
  end

def yes
urec=Urecord.find_by(slot_id: params[:slot_id])
srec=Srecord.find_by(user_id: params[:user_id])
srec.update_column(:status, "Confirmed")
urec.update_column(:status, "Accepted")
flash[:success] = "Accepted Invitation"
redirect_back(fallback_location: root_path)
end
def no
  urec=Urecord.find_by(slot_id: params[:slot_id])
  srec=Srecord.find_by(user_id: params[:user_id])
srec.update_column(:status, "Declined")
urec.update_column(:status, "Declined")
flash[:danger] = "Declined Invitation"
redirect_back(fallback_location: root_path)
end
end
