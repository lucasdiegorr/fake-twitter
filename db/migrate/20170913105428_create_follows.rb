class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower, index: true, foreign_key: {to_table: :users}
      t.references :followed, index: true, foreign_key: {to_table: :users}

      t.timestamps null: false
    end
  end
end
