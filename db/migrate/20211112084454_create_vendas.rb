class CreateVendas < ActiveRecord::Migration[6.1]
  def change
    create_table :vendas do |t|
      t.integer :value
      t.references :firma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
