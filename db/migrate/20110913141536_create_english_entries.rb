class CreateEnglishEntries < ActiveRecord::Migration
  def change
    create_table :english_entries do |t|
      t.string :language, :default => ""
      t.string :term, :default => ""
      t.string :term_class, :default => ""
      t.text :definition, :default => ""

      t.timestamps
    end
  end
end
