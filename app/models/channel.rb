class Channel < ApplicationRecord
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :img_post
end
