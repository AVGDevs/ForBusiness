class AddColumnUserIdToColaborador < ActiveRecord::Migration[5.2]
  def change
    add_column :colaboradors, :user_id, :integer
  end
end
