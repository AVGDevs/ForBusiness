class Fato < ApplicationRecord
    belongs_to :tarefa
    belongs_to :empresa
    belongs_to :departamento
    belongs_to :status
end
