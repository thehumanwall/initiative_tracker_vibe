class CreateScores < ActiveRecord::Migration[8.0]
  def change
    create_table :scores do |t|
      t.references :scale, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :action_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
