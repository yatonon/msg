class Channel < ApplicationRecord
  has_many :users, through: :channel_users
  has_many :messages
end
