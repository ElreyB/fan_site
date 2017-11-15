class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :rating, :integer
      t.column :review, :string
      t.column :book_id, :integer

      t.timestamps
    end
  end
end
