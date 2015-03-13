Item.create_20_items
Category.create_5_categories
ItemCategory.create_item_category_associations

Order.create_5_ordered_orders
Order.create_5_completed_orders
Order.create_3_orders

User.create_rachel
User.create_jeff
User.create_jorge
User.create_josh

# ======================== Seed Data Generation ========================

class Item
  def self.create_15_active_items
    20.times do
      Item.create(name: Faker::Commerce.product_name,
                  description: Faker::Hacker.say_something_smart,
                  image: Faker::Avatar.image,
                  price: Faker::Commerce.price)
    end
  end
end

class Category
  def self.create_5_categories
    5.times do
      Category.create(name: Faker::Commerce.department(1, true))
    end
  end
end

class ItemCategory
  def self.create_item_category_associations
    40.times do
      selected_item = Item.all.sample
      selected_category = Category.all.sample
      ItemCategory.create(item_id: selected_item.id,
                          category_id: selected_category.id)
    end
  end
end

class Order
  def self.create_5_ordered_orders
    3.times do
      selected_user = User.all.sample
      Order.create(user_id: selected_user.id,
                   status: "ordered",
                   created_at: Faker::Time.between(2.days.ago, Time.now),
                   updated_at: Faker::Time.between(2.days.ago, Time.now))
    end
  end

  def self.create_5_completed_orders
    3.times do
      selected_user = User.all.sample
      Order.create(user_id: selected_user.id,
                   status: "completed",
                   created_at: Faker::Time.between(2.days.ago, Time.now),
                   updated_at: Faker::Time.between(2.days.ago, Time.now))
    end
  end

  def self.create_3_cancelled_orders
    3.times do
      selected_user = User.all.sample
      Order.create(user_id: selected_user.id,
                   status: "cancelled",
                   created_at: Faker::Time.between(2.days.ago, Time.now),
                   updated_at: Faker::Time.between(2.days.ago, Time.now))
    end
  end
end

class User
  def self.create_rachel
    User.create(first_name: "Rachel",
                last_name: "Warbelow",
                email: "demo+rachel@jumpstartlab.com",
                password: "password")
  end

  def self.create_jeff
    User.create(first_name: "Jeff",
                last_name: "Casimir",
                email: "demo+jeff@jumpstartlab.com",
                password: "password",
                display_name: "j3")
  end

  def self.create_jorge
    User.create(first_name: "Jorge",
                last_name: "Tellez",
                email: "demo+jorge@jumpstartlab.com",
                password: "password",
                display_name: "novohispano")
  end

  def self.create_josh
    User.create(first_name: "Josh",
                last_name: "Cheek",
                email: "demo+josh@jumpstartlab.com",
                password: "password",
                display_name: "josh",
                role: "admin")
  end
end
