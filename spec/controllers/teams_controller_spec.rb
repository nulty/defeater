require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe 'GET #battle' do
    it 'returns http success' do
      post :battle, teams: 'name'
      expect(response).to have_http_status(:success)
    end
  end

end
