class Transaction < ApplicationRecord
  belongs_to :bank
  belongs_to :account

  validates :amount, presence: true
  validates :date, presence: true
  validates :description, presence: true, length: { maximum: 30 }
  validates :bank_id, presence: true
end
