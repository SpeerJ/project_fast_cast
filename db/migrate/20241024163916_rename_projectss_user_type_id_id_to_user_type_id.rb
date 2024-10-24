class RenameProjectssUserTypeIdIdToUserTypeId < ActiveRecord::Migration[8.0]
  def change
    rename_column :projects, :user_type_id_id, :user_type_id
  end
end
