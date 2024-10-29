class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.references :user, null: false, foreign_key: true
      t.text :summary
      t.vector :embedding, limit: 1536

      t.timestamps
    end
  end
end
