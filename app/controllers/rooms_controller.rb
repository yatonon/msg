class RoomsController < ApplicationController
  def show
    @messages = Message.where(channel_id: params[:id])
  end
end
