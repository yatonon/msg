class MessagesController < ApplicationController
  def index
  end

  def show
    user1, user2 = params[:user_ids]
    _messages = Message.where(from_id: user1, to_id: user2)
      .or(Message.where(from_id: user2, to_id: user1))
    @messages = _messages.present? ? _messages.order('created_at ASC') : nil
  end

  def create
  end
end