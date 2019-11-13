class Colaborador < ApplicationRecord
    belongs_to :departamento
    belongs_to :user
end
