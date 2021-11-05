class AddQuantityToLancamentos < ActiveRecord::Migration[6.1]
  def change
    add_column :lancamentos, :quantity, :integer
  end
end
