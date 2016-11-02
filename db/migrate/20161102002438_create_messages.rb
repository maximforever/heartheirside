class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

    	t.boolean :party
    	t.boolean :positive
    	t.integer :weight
    	t.text :body

      t.timestamps null: false
    end
  end
end
