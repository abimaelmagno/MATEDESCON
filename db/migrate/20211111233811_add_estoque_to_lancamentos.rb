class AddEstoqueToLancamentos < ActiveRecord::Migration[6.1]
  def change
    add_column :lancamentos, :estoque, :integer
  end
end
