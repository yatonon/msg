class Friend < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: { scope: :to_id }, if: :invite_doub?

  scope :established, -> { where(establish: true) }

  private

    def invite_doub?
      establish == false
      apply == true
    end
end
