class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :type
      t.integer :bonus

      t.timestamps
    end
  end
end
