class AddNotesToRiders < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :notes, :text
  end
end
