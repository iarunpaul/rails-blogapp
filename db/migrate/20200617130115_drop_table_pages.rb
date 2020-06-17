class DropTablePages < ActiveRecord::Migration[5.0]
  def up
    drop_table :pages
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
