class ChangeColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :firmas, :product, from: nil, to: 0
  end
end
