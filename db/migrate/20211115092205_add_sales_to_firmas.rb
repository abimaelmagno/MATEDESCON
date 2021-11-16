class AddSalesToFirmas < ActiveRecord::Migration[6.1]
  def change
    add_column :firmas, :sales, :integer
  end
end
