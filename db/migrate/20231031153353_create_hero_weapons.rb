class CreateHeroWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :heroes_weapons do |t|
      t.references :hero, null: false, foreign_key: true
      t.references :weapon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
