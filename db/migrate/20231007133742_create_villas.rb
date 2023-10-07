class CreateVillas < ActiveRecord::Migration
  def change
    create_table :villas do |t|
      t.string :name

      t.timestamps
    end
  end
end
