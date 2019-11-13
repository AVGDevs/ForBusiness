class Departamento < ApplicationRecord
    has_many :colaboradors
    has_many :tarefas
    has_many :fatos
end
