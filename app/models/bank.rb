class Bank < ApplicationRecord
  belongs_to :firma
  has_many :firmas
end
