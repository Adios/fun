class CreateVintagePhotos < ActiveRecord::Migration
  def self.up
    create_table :vintage_photos do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :cyan
      t.integer :yellow
      t.integer :magenta
      t.boolean :bleach
      t.timestamps
    end
  end

  def self.down
    drop_table :vintage_photos
  end
end
