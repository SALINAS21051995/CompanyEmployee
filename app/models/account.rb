class Account < ApplicationRecord
    validates :account_password, confirmation: true
    validates :account_password_confirmation, presence: true
end