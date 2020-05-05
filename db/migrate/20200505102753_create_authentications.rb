class CreateAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :authentications, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :provider, null: false
      t.string :uid, null: false
      t.jsonb :user_info, null: false
      t.jsonb :credentials
      t.jsonb :extra

      t.timestamps
    end
  end
end
