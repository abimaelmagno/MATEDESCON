class ChangeColumnSalesDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :firmas, :sales, from: nil, to: 0
  end
end
