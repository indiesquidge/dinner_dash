class SeedItem
  def self.create_15_active_items
    15.times do
      Item.create(name: Faker::Commerce.product_name,
                  description: Faker::Hacker.say_something_smart,
                  image: Faker::Avatar.image,
                  price: Faker::Commerce.price,
                  status: "active")
    end
  end

  def self.create_5_retired_items
    5.times do
      Item.create(name: Faker::Commerce.product_name,
                  description: Faker::Hacker.say_something_smart,
                  image: Faker::Avatar.image,
                  price: Faker::Commerce.price,
                  status: "retired")
    end
  end
end

class SeedCategory
  def self.create_5_categories
    5.times do
      Category.create(name: Faker::Commerce.department(1, true))
    end
  end
end

class SeedItemCategory
  def self.create_item_category_associations
    40.times do
      selected_item = Item.all.sample
      selected_category = Category.all.sample
      ItemCategory.create(item_id: selected_item.id,
                          category_id: selected_category.id)
    end
  end
end

class SeedUser
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

class SeedOrder
  def self.create_5_ordered_orders
    3.times do
      selected_user = User.all.sample
      order = Order.create(user_id: selected_user.id,
                   status: "ordered",
                   created_at: Faker::Time.between(2.days.ago, Time.now),
                   updated_at: Faker::Time.between(2.days.ago, Time.now))
      2.times { order.items << Item.all.sample }
    end
  end

  def self.create_5_completed_orders
    3.times do
      selected_user = User.all.sample
      order = Order.create(user_id: selected_user.id,
                   status: "completed",
                   created_at: Faker::Time.between(2.days.ago, Time.now),
                   updated_at: Faker::Time.between(2.days.ago, Time.now))
      2.times { order.items << Item.all.sample }
    end
  end

  def self.create_3_cancelled_orders
    3.times do
      selected_user = User.all.sample
      order = Order.create(user_id: selected_user.id,
                   status: "cancelled",
                   created_at: Faker::Time.between(2.days.ago, Time.now),
                   updated_at: Faker::Time.between(2.days.ago, Time.now))
      2.times { order.items << Item.all.sample }
    end
  end
end

# =========================== Seed Data ===========================

SeedItem.create_15_active_items
SeedItem.create_5_retired_items
SeedCategory.create_5_categories
SeedItemCategory.create_item_category_associations

SeedUser.create_rachel
SeedUser.create_jeff
SeedUser.create_jorge
SeedUser.create_josh

SeedOrder.create_5_ordered_orders
SeedOrder.create_5_completed_orders
SeedOrder.create_3_cancelled_orders
