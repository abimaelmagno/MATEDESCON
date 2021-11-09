class CreateFonecedors < ActiveRecord::Migration[6.1]
  def change
    create_table :fonecedors do |t|
      t.string :nome_empresa
      t.string :nome_produto
      t.integer :estoque
      t.integer :price
      t.date :prazo_pagamento
      t.references :firma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
