class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.float :x
      t.float :y
      t.float :z
      t.float :mag
      t.string :spect
      t.float :color

      t.timestamps null: false
    end
  end
end
