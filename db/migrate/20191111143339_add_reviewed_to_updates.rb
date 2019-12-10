class AddReviewedToUpdates < ActiveRecord::Migration[6.0]
  def change
    add_column :updates, :reviewed, :boolean, default: false
  end
end
