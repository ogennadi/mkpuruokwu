class CreateIgboEntries < ActiveRecord::Migration
  def change
    create_table :igbo_entries do |t|
      t.string :language,   :default => ""
      t.string :term,       :default => ""
      t.string :tones,      :default => ""
      t.string :term_class, :default => ""
      t.text   :definition, :default => ""
      
      t.timestamps
    end
  end
end
