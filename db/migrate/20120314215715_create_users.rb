class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.column :login,	:string
    	t.column :password,	:string
    	t.column :name,		:string
    	t.column :email,	:string
    	t.column :position,	:string	
      t.timestamps
    end
  end
end
