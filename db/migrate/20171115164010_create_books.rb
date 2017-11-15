class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.column :name, :string
      t.column :bio, :string
      t.column :genre_id, :integer

      t.timestamps
    end
  end
end
