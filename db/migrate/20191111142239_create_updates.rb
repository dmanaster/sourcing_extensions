class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.string :version
      t.date :date
      t.text :overview
      t.belongs_to :extension, null: false, foreign_key: true

      t.timestamps
    end
  end
end
