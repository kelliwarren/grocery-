require 'spec_helper'

describe ProductsController do
  describe '#index', :focus do 
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
      product = create(:product, user_id: user.id)
      get :show, user_id: user.id, id: product.id
      response.should be_success
    end
  end

  describe '#create'do
    it 'should not allow a user who is not a store owner to create a product' do
      user = create(:user)
      product = build(:product)
      post :create, {user_id: user.id, :product => product.attributes }
      expect(user.products.count).to eq(0)
    end

    it 'should allow a user who is a store_owner to create a product' do
      user = create(:user, store_owner: true)
      store = build(:product)
      post :create, {user_id: user.id, :product => product.attributes }
      expect(user.products.count).to eq(1)
    end
  end

  describe '#update' do
    it 'should not all a user who is not a store owner to update a store' do
      user = create(:user)
      store = create(:store)
      user.stores << store
      put :update, { user_id: store.user.id, id: store.id, :store =>{name: 'new name'} }
      expect(user.stores.last.name).to_not eq('new name')
    end
    it 'should allow a user.store_owner to update a record' do
      user = create(:user, store_owner: true)
      store = create(:store)
      user.stores << store
      put :update, { user_id: store.user.id, id: store.id, :store => {name: 'new name'} }
      expect(user.stores.last.name).to eq('new name')
    end
  end

  describe '#destroy' do
    it 'should not allow a user who is not a store owner to delete a store' do
      user = create(:user)
      store = create(:store)
      user.stores << store
      delete :destroy,{ user_id: store.user.id, id: store.id }
      expect(user.stores.count).to eq(1)
    end
    
    it 'should allow a user.store_owner to delete a store' do
      user = create(:user, store_owner: true)
      store = create(:store)
      user.stores << store
      delete :destroy,{ user_id: store.user.id, id: store.id }
      expect(user.stores.count).to eq(0)
    end
  end

end
