class Bank < ApplicationRecord
    has_many :transactions
    validates :name, presence: true
end
