class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :region
  belongs_to :preparation_day


  validates :title, :text, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :postage_payer_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :preparation_day_id, numericality: { other_than: 1, message: "can't be blank" } 

end
