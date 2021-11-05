class Firma < ApplicationRecord
  belongs_to :user
  has_many :lancamento
  has_many :bank
end
