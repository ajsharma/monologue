class CreateUserRepos < ActiveRecord::Migration
  def change
    create_table :user_repos do |t|
      t.references :user, index: true
      t.references :repo, index: true

      t.timestamps
    end
  end
end
