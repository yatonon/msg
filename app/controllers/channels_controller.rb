class ChannelsController < ApplicationController
  def index
    @channels = current_user.channels
  end

  def show
    @channels = Channel.all
    @users = User.all
    @channelmessage = Channelmessage.new
    @c_messages = Channelmessage.where(channel_id: params[:id]).to_a
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
      :name
    )
  end

end
