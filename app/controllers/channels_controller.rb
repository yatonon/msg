# frozen_string_literal: true

class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, only: %i(show destroy invite_user_index invite_user)

  def index
    @channels = current_user.channels
  end

  def show
    @messages = @channel.messages
  end

  def new
    @channel = current_user.channels.new
  end

  def create
    @channel = current_user.channels.new(channel_params)
    if @channel.save
      redirect_to channels_path
    else
      render :new
    end
  end

  def destroy
    @channel.destroy
    redirect_to channels_path
  end

  def invite_user_index
    @users = User.all
  end

  def invite_user
    ChannelUser.create(channel_id: @channel.id, user_id: params[:user_id])
    redirect_to @channel
  end

  private

    def channel_params
      params.require(:channel).permit(:name)
    end

    def set_channel
      @channel = Channel.find(params[:id])
    end
end
