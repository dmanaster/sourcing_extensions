class ChangeUpdateVersionToUnique < ActiveRecord::Migration[6.0]
  def change
    change_column :updates, :version, :string, unique: true
  end
end
