class CreateActionItems < ActiveRecord::Migration[8.0]
  def change
    create_table :action_items do |t|
      t.string :name
      t.references :metric, null: false, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
  end
end
