class Tarefa < ApplicationRecord
    belongs_to :departamento
    belongs_to :situacao
    has_many :fatos
end
