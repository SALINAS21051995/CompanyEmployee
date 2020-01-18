class Employee < ApplicationRecord
    validates :employee_rfc, length: { in: 12..13, message: 'debe tener de 12 a 13 caracteres.' }
end