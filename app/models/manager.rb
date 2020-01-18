class Manager < ApplicationRecord
    validates :manager_rfc, uniqueness: { case_sensitive: false, mesagge: 'Este rfc ya esta asignado a una compañia' }
    validates :manager_rfc, length: { in: 12..13, mesagge: 'El rfc debe contener entre 12 a 13 caracteres' }
    validates :manager_email,uniqueness: { case_sensitive: false, mesagge: 'Este correo ya esta asignado a una compañia' }
end