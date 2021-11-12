class AddDateToLancamentos < ActiveRecord::Migration[6.1]
  def change
    add_column :lancamentos, :date, :integer
  end
end
