require 'spec_helper'

describe UsersController do

  describe '#index' do
    example do
      create(:user)
      get :index
      expect(assigns(:users)).to_not be_empty
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