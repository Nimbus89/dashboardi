class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :date_created
      t.datetime :last_modified
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
