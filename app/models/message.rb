class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  after_create_commit { MessageBroadcastJob.perform_later self }
end
