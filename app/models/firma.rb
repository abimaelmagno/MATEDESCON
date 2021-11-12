class Firma < ApplicationRecord
  belongs_to :user
  has_many :lancamentos
  has_many :banks
  has_many :fornecedores
  has_many :vendas

  has_one_attached :photo, dependent: :destroy

  validates :name, presence: true
  validates :sector, presence: true
  validates :capital, numericality: { greater_than: 0 }
  validates :product, numericality: { greater_than: -1 }
end
