require 'spec_helper'

describe StoresController do
  describe '#index' do
    it '@stores should be available in stores/index page' do
      store = create(:store)
      get :index, user_id: store.user_id
      expect(assigns(:stores)).to_not be_empty
    end
  end
  describe '#create'do
    it 'should not allow a user who is not a store owner to create a store' do
      user = create(:user)
      store = build(:store)
      post :create, {user_id: user.id, :store => store.attributes }
      expect(user.stores.count).to eq(0)
    end
    it 'should allow a user who is a store_owner to create a store' do
      user = create(:user, store_owner: true)
      store = build(:store)
      post :create, {user_id: user.id, :store => store.attributes }
      expect(user.stores.count).to eq(1)
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
