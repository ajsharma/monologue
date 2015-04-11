class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :provider_id
      t.string :name
      t.string :full_name
      t.string :description
      t.boolean :private
      t.boolean :fork

      t.timestamps
    end
  end
end
