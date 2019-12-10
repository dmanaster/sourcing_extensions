class AddMajorToUpdates < ActiveRecord::Migration[6.0]
  def change
    add_column :updates, :major, :boolean, default: false
  end
end
