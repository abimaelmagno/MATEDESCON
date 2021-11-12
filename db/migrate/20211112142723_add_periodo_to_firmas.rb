class AddPeriodoToFirmas < ActiveRecord::Migration[6.1]
  def change
    add_column :firmas, :periodo, :integer, default: 0
  end
end
