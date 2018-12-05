class User < ApplicationRecord
  has_many :channel_users
  has_many :friends
  has_many :channels, through: :channel_users
  accepts_nested_attributes_for :channel_users
  validates :user_original, uniqueness: true, allow_nil: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_monologue_channel

  def create_monologue_channel
    channels.create(name: '自分')
  end
end
