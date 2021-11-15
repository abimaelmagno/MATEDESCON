class Fixvendas < ActiveRecord::Migration[6.1]
  def change
    rename_column :firmas, :vendas, :fvendas
  end
end
