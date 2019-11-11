class CreateExtensions < ActiveRecord::Migration[6.0]
  def change
    create_table :extensions do |t|
      t.string :name
      t.string :url
      t.string :site

      t.timestamps
    end
  end
end
