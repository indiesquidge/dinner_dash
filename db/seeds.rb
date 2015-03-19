
class SeedItem
  def self.create_20_active_items
    adjectives = ["delicious", "chewy", "crispy", "wholesome", "crunchy", "heavenly"]
    cookies    = ["chocolate chip", "sugar", "whoopi pie", "almond", "snickerdoodle", "peanut butter"]
    20.times do
      Item.create(name: "#{adjectives.sample} #{cookies.sample} cookie",
                  description: "very #{adjectives.sample}",
                  price: Faker::Commerce.price)
    end
  end

  def self.retire_5_items
    5.times do
      item = Item.all.sample
      item.status = "retired"
      item.save!
    end
  end
end

class SeedCategory
  def self.create_5_categories
    categories = ["gluten free", "sugar free", "nutty", "chocolate"]
    5.times do
      Category.create(name: "#{categories.sample}")
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

  def self.create_admin_josh
    User.create(first_name: "Josh",
                last_name: "Cheek",
                email: "demo+josh@jumpstartlab.com",
                password: "password",
                display_name: "josh",
                role: "admin")
  end
end

class SeedOrder
  def self.create_10_orders
    10.times do
      selected_user = User.all.sample
      order = Order.create(user_id: selected_user.id,
                           status: "ordered",
                           created_at: Faker::Time.between(2.days.ago, Time.now),
                           updated_at: Faker::Time.between(2.days.ago, Time.now))
      2.times { order.items << Item.all.sample }
    end
  end

  def self.three_completed_orders
    3.times do
      order = Order.all.sample
      order.status = "completed"
      order.save!
    end
  end

  def self.two_cancelled_orders
    2.times do
      order = Order.all.sample
      order.status = "cancelled"
      order.save!
    end
  end
end

# =========================== Seed Data ===========================

SeedItem.create_20_active_items
SeedItem.retire_5_items
SeedCategory.create_5_categories
SeedItemCategory.create_item_category_associations

SeedUser.create_rachel
SeedUser.create_jeff
SeedUser.create_jorge
SeedUser.create_admin_josh

SeedOrder.create_10_orders
SeedOrder.three_completed_orders
SeedOrder.two_cancelled_orders
