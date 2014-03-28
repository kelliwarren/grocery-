require 'spec_helper'

describe OrdersController do
  describe '#index' do 
    it 'should list all orders for a store' do 
      user = create(:user, store_owner: true)
      order = create(:order)
      store = create(:store, user_id: user.id)
      store.orders << order
      get :index, store_id: store.id
      expect(assigns(@orders)).to_not be_empty
    end
     it 'should list all orders for a consumer' do 
      consumer = create(:user)
      order = create(:order)
      store = create(:store)
      store.orders << order
      get :index, user_id: consumer.id
      expect(assigns(@orders)).to_not be_empty
    end
  end
end

