class ChangeColumnVendasDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :firmas, :vendas, from: nil, to: 0
  end
end
