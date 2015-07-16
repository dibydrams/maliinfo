class AddEmphasizeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :carousel, :boolean
    add_column :posts, :flash, :boolean
  end
end
