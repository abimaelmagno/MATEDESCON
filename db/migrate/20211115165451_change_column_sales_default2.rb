class ChangeColumnSalesDefault2 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :firmas, :sales, from: nil, to: 1
  end
end
