class ChangeColumnSalesDefault1 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :firmas, :sales, to: 1
  end
end
