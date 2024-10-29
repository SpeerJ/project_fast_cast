class CreateCastingProposals < ActiveRecord::Migration[8.0]
  def change
    create_table :casting_proposals do |t|
      t.references :casting_director, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
