class Friend < ApplicationRecord
  belongs_to :user

  # validates :user_id,:uniqueness => {:scope =>[:to_id, :] }
end
end
