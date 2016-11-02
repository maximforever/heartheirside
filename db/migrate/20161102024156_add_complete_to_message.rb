class AddCompleteToMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :complete, :boolean
  end
end
