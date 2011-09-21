class ChangeTermToText < ActiveRecord::Migration
  def up
    change_column :igbo_entries, :term, :text, :default => ""
    change_column :english_entries, :term, :text, :default => ""
  end

  def down
    change_column :igbo_entries, :term, :string, :default => ""
    change_column :english_entries, :term, :string, :default => ""
  end
end
