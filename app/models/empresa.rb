class Empresa < ApplicationRecord
    has_many :fatos
    belongs_to :situacao
end
