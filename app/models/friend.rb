class Friend < ApplicationRecord
  belongs_to :user

  # validates :user_id,uniqueness:true
  validates :user_id,:uniqueness => {:scope =>[:to_id]}

  with_options if: :establish? do
    validates :establish,  inclusion: { in: [false] }
    validates :apply,  inclusion: { in: [true] }
  end
end
