class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.index :name, unique: true #同じメンバーのグループの重複を防ぐモノだと思われる
      t.timestamps
    end
  end
end
