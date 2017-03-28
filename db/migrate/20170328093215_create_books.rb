class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :resume
      t.integer :status

      t.timestamps
    end
  end
end
