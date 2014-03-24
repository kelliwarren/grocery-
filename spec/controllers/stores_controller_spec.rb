require 'spec_helper'

describe StoresController do
  describe '#index' do
    example do
      store = create(:store)
      get :index, user_id: store.user_id
      expect(assigns(:stores)).to_not be_empty
    end
  end
  #test to make sure only a user.store_owner can create a store
  describe '#create'do
    example do
      user = create(:user)
      store = build(:store)
      post :create, {user_id: user.id, :store => store.attributes }
      expect(user.stores.count).to eq(0)
    end
    it 'should allow a user to create a store' do
      user = create(:user, store_owner: true)
      store = build(:store)
      post :create, {user_id: user.id, :store => store.attributes }
      expect(user.stores.count).to eq(1)
    end
  end
  #test to make sure only a user.store_owner can update a store
  describe '#update', :focus  do
    example do
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
  # #only a user.store_owner should be able to delete a store
  describe '#destoy' do
    example do
      user = create(:user)
      store = create(:store)
      user.stores << store
      delete :destroy,{ user_id: store.user.id, id: store.id }
      expect(user.stores.count).should eq(1)
    end
    example do
      user = create(:user, store_owner: true)
      store = create(:store)
      user.stores << store
      delete :destroy,{ user_id: store.user.id, id: store.id }
      expect(user.stores.count).should eq(0)
    end
  end
end
