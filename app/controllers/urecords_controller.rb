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

end
def no
  urec=Urecord.find_by(slot_id: params[:slot_id])
  srec=Srecord.find_by(user_id: params[:user_id])
srec.update_column(:status, "Declined")
urec.update_column(:status, "Declined")

end
end
