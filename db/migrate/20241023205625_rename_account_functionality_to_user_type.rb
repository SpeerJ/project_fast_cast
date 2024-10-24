class RenameAccountFunctionalityToUserType < ActiveRecord::Migration[8.0]
  def change
    rename_table :account_functionalities, :user_types
  end
end
