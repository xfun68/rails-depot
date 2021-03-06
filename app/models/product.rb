class Product < ActiveRecord::Base
  has_many :line_items

  def self.find_products_for_sale
    find(:all, :order => "title")
  end

  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 10, :message => 'seems too  short, should be at least 10 chars'
  validates_format_of :image_url,
    :with => %r{\.(gif|png|jpg)}i,
    :message => "must be a URL for GIT, PNG or JPG image"

  protected
    def price_must_be_at_least_a_cent
      errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
    end

end
