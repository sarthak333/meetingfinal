class SrecordController < ApplicationController

  def new
  end

def show
end
def create
  @srecord= Srecord.create(:slot_id => params[:slot_id], :user_id => params[:user_id])
  @urecord= Urecord.create(:slot_id => params[:slot_id], :user_id => params[:user_id])
end
end
