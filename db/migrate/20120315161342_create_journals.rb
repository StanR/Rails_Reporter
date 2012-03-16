class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
    	t.string :work
    	t.text :activity
      t.date :date
    	t.integer :hours
    	t.integer :minutes
      t.references :user
    	t.references :project
      t.timestamps
    end
    add_index :journals, :user_id
    add_index :journals, :project_id
  end
end
