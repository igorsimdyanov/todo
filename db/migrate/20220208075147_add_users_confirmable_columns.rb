class AddUsersConfirmableColumns < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
