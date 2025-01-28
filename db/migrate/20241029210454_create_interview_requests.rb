class CreateInterviewRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :interview_requests do |t|
      t.references :casting_director, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.boolean :sent_by_cd
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
