class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :users

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category_attribute.values.each do |attr|
        if attr != ""
        category = Category.find_or_create_by(category_attribute)
        self.post_categories.build(category_id:category[:id])
        end
      end
    end
  end

  def users_attributes
  end

   



end
