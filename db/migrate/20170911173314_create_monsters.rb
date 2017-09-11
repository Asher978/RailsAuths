class CreateMonsters < ActiveRecord::Migration[5.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.text :bio
      t.belongs_to :user

      t.timestamps
    end
  end
end
