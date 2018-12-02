class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, only: %i(show)

  def index
    @channels = current_user.channels
  end

  def show
    @messages = Message.where(channel_id: params[:id])
  end

  def new
    @channel = current_user.channels.new
  end

  def create
    @channel = current_user.channels.create(channel_params)
    redirect_to channels_path
  end

  private

  def channel_params
    params.require(:channel).permit(
      :name
    )
  end

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
