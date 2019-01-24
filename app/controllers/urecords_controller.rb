class UrecordsController < ApplicationController

def new
end

  def create
  end

def yes
urec=Urecord.where(:slot_id => params[:slot_id], :user_id => params[:user_id]).first
srec=Srecord.where(:slot_id => params[:slot_id], :user_id => params[:user_id]).first
srec.update_column(:status, "Confirmed")
urec.update_column(:status, "Accepted")
    redirect_back(fallback_location: root_path)
end
def no
urec=Urecord.where(:slot_id => params[:slot_id], :user_id => params[:user_id]).first
srec=Srecord.where(:slot_id => params[:slot_id], :user_id => params[:user_id]).first
srec.update_column(:status, "Declined")
urec.update_column(:status, "Declined")
    redirect_back(fallback_location: root_path)
end
end
