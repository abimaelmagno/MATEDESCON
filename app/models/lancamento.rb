class Lancamento < ApplicationRecord
  belongs_to :firma
  has_many :firmas

  def capital
  end

  def estoque
  end
end
