class Firma < ApplicationRecord
  belongs_to :user
  has_many :lancamentos
  has_many :banks
  has_many :fornecedores
end
