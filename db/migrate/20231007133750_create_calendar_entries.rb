class CreateCalendarEntries < ActiveRecord::Migration
  def change
    create_table :calendar_entries do |t|
      t.references :villa, null: false, foreign_key: true
      t.date :date
      t.decimal :rate
      t.boolean :available

      t.timestamps
    end

    add_index :calendar_entries, :villa_id
    add_index :calendar_entries, :date
  end
end
