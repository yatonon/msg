class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  mount_uploader :image, ImageUploader

  after_create_commit { MessageBroadcastJob.perform_later self }
end
