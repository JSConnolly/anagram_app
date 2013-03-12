class CreateWords < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.string :canonical
      t.integer :length
    end
  end
end
