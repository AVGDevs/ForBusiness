class Fato < ApplicationRecord
    belongs_to :tarefa
    belongs_to :empresa
end
