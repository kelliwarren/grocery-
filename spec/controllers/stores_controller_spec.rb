require 'spec_helper'

describe StoresController do

  describe '#index' do
    example do
      store = create(:store)
      get :index, user_id: store.user_id
      expect(assigns(:stores)).to_not be_empty
    end
  end

  # describe '#show' do
  #   example do
  #     list = create(:list, name: 'Grocery List')
  #     get :show, {id: list.id}
  #     expect(assigns(:list).name).to eq 'Grocery List'
  #   end
  # end


end