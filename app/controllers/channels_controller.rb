class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    @channel.save
    redirect_to channels_path
  end

  private

  def channel_params
    params.require(:channel).permit(
      :roomname
    )
  end

end
