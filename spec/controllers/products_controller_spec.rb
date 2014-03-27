require 'spec_helper'

describe ProductsController do
  describe '#index' do 
    it 'should allow all users regardless of being signed in or store owner to access the index action' do 
      user = create(:user, store_owner: true)
      product = create(:product)
      store = create(:store, user_id: user.id)
      store.products << product
      get :index, user_id: user.id, store_id: store.id
      expect(assigns(@products)).to_not be_empty
    end
  end
  describe '#show' do 
    it "should be available to show view" do
      user = create(:user, store_owner: true)
      store = create(:store, user_id: user.id)
      product = create(:product, store_id: store.id)
      get :show, user_id: user.id, store_id: store.id, id: product.id
      response.should be_success
    end
  end

  describe '#create' do
    it 'should not allow a user who is not a store owner to create a product' do
      user = create(:user)
      store = create(:store, user_id: user.id)
      product = create(:product)
      post :create, {user_id: user.id, store_id: store.id, :product => product.attributes }
      expect(store.products.count).to eq(0)
    end
    it 'should allow a user who is a store_owner to create a product' do
      user = create(:user, store_owner: true)
      store = create(:store, user_id: user.id)
      product = build(:product, store_id: store.id)
      post :create, {user_id: user.id, store_id: store.id, :product => product.attributes }
      expect(store.products.count).to eq(1)
    end
  end
  describe '#update' do
    it 'should not allow a user who is not a store owner to update a product' do
      user = create(:user, store_owner: true)
      store = create(:store, user_id: user.id)
      user2 = create(:user)
      product = build(:product, store_id: store.id)
      put :update, { user_id: user2.id, store_id: store.id, id: product.id, :product => {name: 'new name'}}
      expect(store.products.last.name).to_not eq('new name')
    end
    it 'should allow a user.store_owner to update a record' do
      user = create(:user, store_owner: true)
      store = create(:store, user_id: user.id)
      product = build(:product, store_id: store.id)
      store.products << product
      put :update, { user_id: user.id, store_id: store.id, id: product.id, :product => {name: 'new name'}}
      expect(store.products.last.name).to eq('new name')
    end
  end

  describe '#destroy', :focus do
    it 'should not allow a user who is not a store owner to delete a product' do
      user = create(:user, store_owner: true)
      store = create(:store, user_id: user.id)
      user2 = create(:user)
      product = create(:product, store_id: store.id)
      delete :destroy,{ user_id: user2.id, store_id: store.id, id: product.id }
      expect(store.products.count).to_not eq(0)
    end
    
    it 'should allow a user.store_owner to delete a store' do
      user = create(:user, store_owner: true)
      store = create(:store, user_id: user.id)
      product = create(:product, store_id: store.id)
      delete :destroy,{ user_id: user.id, store_id: store.id, id: product.id }
      expect(store.products.count).to eq(0)
    end
  end

end
