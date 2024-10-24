class RenameCastingsUserTypeIdIdToUserTypeId < ActiveRecord::Migration[8.0]
  def change
    rename_column :castings, :user_type_id_id, :user_type_id
  end
end
