class AddCarToReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :car, foreign_key: true
  end
end
