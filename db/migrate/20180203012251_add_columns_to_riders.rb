class AddColumnsToRiders < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :allergies, :text
    add_column :riders, :health, :text
    add_column :riders, :interview, :date
    add_column :riders, :accepted, :boolean, default: false
  end
end
