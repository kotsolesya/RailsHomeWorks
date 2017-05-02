class AddImageableToImages < ActiveRecord::Migration
  def up
    change_table :images do |t|
      t.references :imageable, :polymorphic => true
    end
  end

  def down
    change_table :images do |t|
      t.remove_references :imageable, :polymorphic => true
    end
  end
end
