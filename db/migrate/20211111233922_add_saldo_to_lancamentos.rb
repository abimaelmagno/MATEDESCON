class AddSaldoToLancamentos < ActiveRecord::Migration[6.1]
  def change
    add_column :lancamentos, :saldo, :integer
  end
end
