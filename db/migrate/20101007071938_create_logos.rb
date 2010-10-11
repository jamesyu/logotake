class CreateLogos < ActiveRecord::Migration
  def self.up
    create_table :logos do |t|
      t.string :text, :length => 20
      t.string :type, :null => false
      t.timestamps
    end
    
    add_index :logos, :type
  end

  def self.down
    drop_table :logos
  end
end
