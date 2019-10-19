class RemoveColumnlogColaboradorColaboradorFromFatos < ActiveRecord::Migration[5.2]
  def change
    remove_column :fatos, :logColaborador
  end
end
