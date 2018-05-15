class AddHintToAccesses < ActiveRecord::Migration[5.2]
  def change
    add_column :accesses, :hint, :string
  end
end
