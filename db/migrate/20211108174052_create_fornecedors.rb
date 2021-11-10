class CreateFornecedors < ActiveRecord::Migration[6.1]
  def change
    create_table :fornecedors do |t|
      t.string :name
      t.string :name_produto
      t.integer :estoque
      t.integer :preco
      t.date :prazo
      t.references :firma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
