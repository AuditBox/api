class InitialSchema < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
    create_table :organizations, id: :uuid do |t|
      t.string :name
      t.timestamps
    end

    create_table :access_keys, id: :uuid do |t|
      t.string :write_key
      t.string :secret_key
      t.boolean :test, default: true
      t.belongs_to :organization,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.timestamps
    end

    create_table :assets, id: :uuid do |t|
      t.belongs_to :organization,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.jsonb :props, null: false, default: {}
      t.jsonb :tags, null: false, default: {}
      t.string :asset_type
      t.string :handle
      t.timestamps
    end

    create_table :controls, id: :uuid do |t|
      t.belongs_to :organization,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.string :handle
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :artifacts, id: :uuid do |t|
      t.belongs_to :organization,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.belongs_to :control,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.belongs_to :asset,
                   null: true, type: :uuid, foreign_key: true, index: true
      t.jsonb :props, null: false, default: {}
      t.text :description
      t.timestamps
    end

    create_table :scopes, id: :uuid do |t|
      t.string :name, null: false
      t.text :tags, array: true, default: []
      t.belongs_to :organization,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.index %i[name organization_id], unique: true
      t.timestamps
    end

    create_table :control_scopes, id: :uuid do |t|
      t.belongs_to :control,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.belongs_to :scope,
                   null: false, type: :uuid, foreign_key: true, index: true
      t.timestamps
    end

    add_index :control_scopes, %i[control_id scope_id], unique: true # end

    # create_table :asset_tags, id: :uuid do |t|
    #   t.belongs_to :asset, null: false, type: :uuid, foreign_key: true, index: true
    #   t.belongs_to :tag, null: false, type: :uuid, foreign_key: true, index: true
    #   t.timestamps
    # end

    # create_table :tags, id: :uuid do |t|
    #   t.belongs_to :organization, null: false, type: :uuid, foreign_key: true, index: true
    #   t.string :key
    #   t.string :value
    #   t.timestamps
    # end
  end
end
