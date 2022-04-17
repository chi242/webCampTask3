class Books < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :opinion
      t.timestamps
      t.integer :user_id
    end
  end
end