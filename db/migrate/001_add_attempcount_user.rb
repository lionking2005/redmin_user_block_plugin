class AddAttempcountUser < Rails.version < '5.2' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def up
    add_column :users, :attemp_login_count, :integer
  end
 
  def down
    remove_column :users, :attemp_login_count
  end
end
