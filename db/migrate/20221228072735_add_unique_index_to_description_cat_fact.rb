class AddUniqueIndexToDescriptionCatFact < ActiveRecord::Migration[6.1]
  def change
    add_index :cat_facts, :description, unique: true
  end
end
