class Subtrack < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :amount
    validates :date
  end
end
