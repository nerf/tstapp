class CreateOwners < ActiveRecord::Migration
  def self.up
    create_table :owners do |t|
      t.integer :company_id
      t.string :kind
      t.string :name
      t.string :passport
      t.timestamps
    end
  end

  def self.down
    drop_table :owners
  end
end
