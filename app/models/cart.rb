class Cart
  attr_reader :data

  def initialize(input_data)
    @data = input_data || Hash.new
  end

  def add_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] += 1
  end

  def item_quantity(item)
    data[item.id.to_s]
  end

  def count_total
    data.values.sum
  end

  def total_price
    (data.map { |k, v| Item.find(k.to_i).price * v }).reduce(:+)
  end

  def display_items
    data.map { |k, v| [Item.find(k.to_i), v] }
  end

  def remove_item(item)
    data[item.id.to_s] -= 1
    if data[item.id.to_s] == 0
      data.delete(item.id.to_s)
    end
  end

  def remove_all_of_item(item)
    data.delete(item.id.to_s)
  end
end
