class Situacao < ApplicationRecord
    has_many :departamentos
    has_many :tarefas
    has_many :empresas
end