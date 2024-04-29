class Subscription < ApplicationRecord
  validates :stripe_id, presence: true, uniqueness: true
  validates :status, presence: true

  enum status: { unpaid: 0, paid: 1, canceled: -1 }
end
