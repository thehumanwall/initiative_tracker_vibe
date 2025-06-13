class CreateScales < ActiveRecord::Migration[8.0]
  def change
    create_table :scales do |t|
      t.string :name
      t.text :description
      t.integer :value

      t.timestamps
    end
  end
end
