class Account < ApplicationRecord
  validates :account_balance, presence: true
  validates :account_name, presence: true
  belongs_to :customer
end
