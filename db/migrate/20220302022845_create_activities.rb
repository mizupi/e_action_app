class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :act_name_id, null: false
      t.timestamps
    end
  end
end
