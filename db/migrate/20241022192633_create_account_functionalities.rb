class CreateAccountFunctionalities < ActiveRecord::Migration[8.0]
  def change
    create_table :account_functionalities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
