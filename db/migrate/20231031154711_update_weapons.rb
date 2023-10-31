class UpdateWeapons < ActiveRecord::Migration[7.0]
  def change
    change_table :weapons do |t|
      t.rename :type, :weapon_type
    end
  end
end
