class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :book_title
      t.text :book_description
      t.string :author

      t.timestamps
    end
  end
end
