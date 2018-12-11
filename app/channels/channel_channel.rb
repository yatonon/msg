class ChannelChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'channel_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! user_id: data['send_user'], content: data['message'], channel_id: data['channel_id'], image: data['image']
  end
end
