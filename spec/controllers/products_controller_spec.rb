require 'spec_helper'

describe ProductsController do
  describe '#index', :focus do 
    it 'should allow all users regardless of being signed in or store owner to access the index action' do 
      user = create(:user, store_owner: true)
      product = create(:product)
      store = create(:store, user_id: user.id)
      store.products << product
      get :index, {user_id: user, store_id: store}
      expect(assigns(@products)).to_not be_empty
    end
  end
  describe '#show' do 
    it 'should allow all users regardless of being signed in or store owner to access the index action' do 
      user = create(:user, store_owner: true)
      product = create(:product)
      store = create(:store, user_id: user.id)
      store.products << product
      get :index, {user_id: user, store_id: store}
      expect(assigns(@products)).to_not be_empty
    end
  end
  describe '#index' do 
    it 'should allow all users regardless of being signed in or store owner to access the index action' do 
      user = create(:user, store_owner: true)
      product = create(:product)
      store = create(:store, user_id: user.id)
      store.products << product
      get :index, {user_id: user, store_id: store}
      expect(assigns(@products)).to_not be_empty
    end
  end
  describe '#index' do 
    it 'should allow all users regardless of being signed in or store owner to access the index action' do 
      user = create(:user, store_owner: true)
      product = create(:product)
      store = create(:store, user_id: user.id)
      store.products << product
      get :index, {user_id: user, store_id: store}
      expect(assigns(@products)).to_not be_empty
    end
  end
  describe '#index' do 
    it 'should allow all users regardless of being signed in or store owner to access the index action' do 
      user = create(:user, store_owner: true)
      product = create(:product)
      store = create(:store, user_id: user.id)
      store.products << product
      get :index, {user_id: user, store_id: store}
      expect(assigns(@products)).to_not be_empty
    end
  end
end
