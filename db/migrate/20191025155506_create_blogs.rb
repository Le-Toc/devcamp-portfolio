#The genorator command took our command and created this code from it.
#The command was "rails g scaffold Blog title:string body:text"

class CreateBlogs < ActiveRecord::Migration[6.0] #Here it is creating a blogs database table
  def change
    create_table :blogs do |t| #Here are the attributes we added into the command
      t.string :title
      t.text :body

      t.timestamps # Rails gave us this by default
    end
  end
end
