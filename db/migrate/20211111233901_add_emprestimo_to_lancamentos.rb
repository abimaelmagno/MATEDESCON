class AddEmprestimoToLancamentos < ActiveRecord::Migration[6.1]
  def change
    add_column :lancamentos, :emprestimo, :integer
  end
end
