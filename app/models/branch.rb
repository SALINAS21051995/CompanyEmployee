class Branch < ApplicationRecord    
    validates :branch_code, length: { minimum: 5, message: 'debe contener mínimo 5 dígitos.' }
end