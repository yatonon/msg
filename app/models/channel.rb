class Channel < ApplicationRecord
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validate :forbid_blank_name

  def forbid_blank_name
    if name.blank?
      errors[:base] << 'チャンネル名を入力してください'
    end
  end
end
