class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :google_id, null: false
      t.string :name
      t.string :email
      t.belongs_to :organization,
                   null: true, type: :uuid, foreign_key: true, index: true
      t.timestamps
    end
    add_index :users, %i[google_id]
  end
end
