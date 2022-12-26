class AddLikesToCatFact < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :cat_fact, foreign_key: true
  end
end
