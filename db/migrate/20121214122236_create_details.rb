class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :uid
      t.string :fname
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
