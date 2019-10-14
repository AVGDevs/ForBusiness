class Tarefa < ApplicationRecord
    belongs_to :departamento
    has_many :fatos
end
