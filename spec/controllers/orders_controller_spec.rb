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

    describe '#show' do
    it "should be available to show store's order" do
      user = create(:user, store_owner: true)
      store = create(:store, user_id: user.id)
      order = create(:order)
      get :show, id: order.id
      response.should be_success
    end


   it "should be available to show consumer's order" do
      consumer = create(:user)
      store = create(:store)
      order = create(:order)
      get :show, id: order.id
      response.should be_success
    end
  end


   describe '#create' do

    it 'should allow a consumer to create an order' do
      consumer = create(:user)
      store = create(:store)
      order = create(:order, user_id: consumer, store_id: store)
      post :create, user_id: consumer.id, order: order.attributes
      expect(order.count).to eq(1)
    end
  end

  # describe '#update' do

  #   it 'should allow a consumer to update an order' do
  #     consumer = create(:user)
  #     store = create(:store)
  #     order = create(:order)
  #     product = create(:product, store_id: store.id)
  #     order.products << product
  #     put :update, { user_id: consumer.id, store_id: store.id, id: product.id, :product => {name: 'new name'}}
  #     expect(order.products.last.name).to eq('new name')
  #   end
  # end

   describe '#destroy', :focus do
     it 'should allow a user.store_owner to delete an order' do
      user = create(:user, store_owner: true)
      store = create(:store)
      order = create(:order)
      delete :destroy,{ store_id: store.id, id: order.id }
      expect(store.orders.count).to eq(0)
    end

     it 'should allow a consumer to delete an order' do
      consumer = create(:user)
      store = create(:store)
      order = create(:order)
      delete :destroy,{ user_id: consumer.id, id: order.id }
      expect(consumer.orders.count).to eq(0)
    end
  end








end

