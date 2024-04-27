class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :stripe_id, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
