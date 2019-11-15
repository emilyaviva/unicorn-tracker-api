class CreateUnicorns < ActiveRecord::Migration[6.0]
  def change
    create_table :unicorns do |t|
      t.string :name
      t.string :color
      t.string :food
      t.string :location

      t.timestamps
    end
  end
end
