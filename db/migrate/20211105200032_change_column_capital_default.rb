class ChangeColumnCapitalDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :firmas, :capital, from: nil, to: 10000
  end
end
