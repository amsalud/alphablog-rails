class CreateArticleCategoriesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :articles
  end
end
