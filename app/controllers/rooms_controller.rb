class RoomsController < ApplicationController
  def show
    @messages = Message.where(room_id: params[:id])
  end
end
