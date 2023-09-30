class CreateActivityLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_logs do |t|
      t.string :title
      t.integer :duration
      t.string :activity

      t.timestamps
    end
  end
end
