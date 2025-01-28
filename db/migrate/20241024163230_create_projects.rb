class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.references :user_type_id, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end

    add_reference :castings, :project

  end
end
