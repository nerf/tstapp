class AddFileFieldToOwner < ActiveRecord::Migration
  def self.up
    change_table :owners do |t|
      t.string :file
    end
  end

  def self.down
    change_table :owners do |t|
      t.remove :file
    end
  end
end
