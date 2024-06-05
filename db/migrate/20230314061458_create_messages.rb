class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.string :name
      t.string :email
      t.string :image
      t.string :user_created

      t.timestamps
    end
  end
end
