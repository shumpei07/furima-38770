class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :name           , null: false
      t.text       :introduction   , null: false
      t.integer    :category_id    , null: false
      t.references :item_condition , null: false
      t.references :postage_payer  , null: false
      t.references :prefection     , null: false
      t.references :preparation_day, null: false
      t.references :user           , null: false
      t.integer    :price          , null: false
      t.timestamps

    end
  end
end

