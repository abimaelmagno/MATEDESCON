class AddPrazoToFornecedors < ActiveRecord::Migration[6.1]
  def change
    add_column :fornecedors, :prazo, :integer
  end
end
