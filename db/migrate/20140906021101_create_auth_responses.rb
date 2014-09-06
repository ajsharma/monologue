class CreateAuthResponses < ActiveRecord::Migration
  def change
    create_table :auth_responses do |t|
      t.references :user, index: true
      t.string :provider
      t.text :raw

      t.timestamps
    end
  end
end
