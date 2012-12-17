# This migration comes from twitter (originally 20121217063118)
class CreateTwitterTweets < ActiveRecord::Migration
  def change
    create_table :twitter_tweets do |t|
      t.integer :uid
      t.string :tweet

      t.timestamps
    end
  end
end
