require "rails_helper"

RSpec.describe ItemOrder, type: :model do
  describe 'is valid' do
    it 'has a default quantity' do
      item_order = create(:item_order)
      expect(item_order.quantity).to eq(1)
    end

    it 'can be saved' do
      item_order = build(:item_order)
      item_order.save
      expect(item_order.id).to be_truthy
    end
  end

  describe 'it is invalid' do
    it 'cannot be saved with a quantity of 0' do
      item_order = build(:item_order, quantity: 0)
      item_order.save
      expect(item_order.id).to be_nil
    end
  end
end
