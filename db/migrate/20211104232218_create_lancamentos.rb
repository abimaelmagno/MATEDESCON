class CreateLancamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :lancamentos do |t|
      t.string :tipo
      t.date :date
      t.integer :value
      t.references :firma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
