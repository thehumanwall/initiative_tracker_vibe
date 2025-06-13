class CreateMetrics < ActiveRecord::Migration[8.0]
  def change
    create_table :metrics do |t|
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
