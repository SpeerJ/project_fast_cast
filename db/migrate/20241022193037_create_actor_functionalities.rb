class CreateActorFunctionalities < ActiveRecord::Migration[8.0]
  def change
    create_table :actor_functionalities do |t|
      t.integer :rating
      t.text :about_me
      t.date :date_of_birth
      t.string :city
      t.integer :on_time_percent
      t.integer :reschedule_remote_percent
      t.integer :reschedule_in_person_percent
      t.references :actor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
