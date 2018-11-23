class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = message.new(message_params)
    @message.save
    redirect_to channel_path(@message.channel_id)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :user_id, :channel_id)
    end
end
