class CreateBusyMoments < ActiveRecord::Migration[8.0]
  def change
    create_table :busy_moments do |t|
      t.references :user_type, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
