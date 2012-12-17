# This migration comes from twitter (originally 20121217063217)
class CreateTwitterSubscriptions < ActiveRecord::Migration
  def change
    create_table :twitter_subscriptions do |t|
      t.integer :uid
      t.integer :suid

      t.timestamps
    end
  end
end
