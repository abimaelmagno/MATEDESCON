class ChangeColumnSalesDefault3 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :firmas, :sales, from: 1, to: 0
  end
end
