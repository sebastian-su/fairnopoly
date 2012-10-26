# This migration comes from tinycms (originally 20121012041837)
class CreateTinycmsContents < ActiveRecord::Migration
  def change
    create_table :tinycms_contents do |t|
      t.string :key
      t.string :body
      t.timestamps
    end
    add_index :tinycms_contents, :key, unique: true
  end
end
