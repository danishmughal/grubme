class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.timestamps

      t.integer :user_id # User id of the person who created the meal
      t.string :title
      t.string :description
      t.string :location
      t.string :city
      t.string :state

      t.boolean :public, :default => true

      t.datetime :mealtime



    end
  end
end