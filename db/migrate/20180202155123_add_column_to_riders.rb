class AddColumnToRiders < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :waiver, :boolean, default: false
  end
end
