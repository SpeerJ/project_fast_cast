class CreateCasting < ActiveRecord::Migration[8.0]
  def change
    create_table :castings do |t|
      t.references :user_type_id, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
