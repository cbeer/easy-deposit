require 'rails_helper'

RSpec.describe 'Deposits', type: :request do
  before do
    sign_in_as_a_valid_user
  end

  describe 'GET /deposits' do
    it 'works! (now write some real specs)' do
      get deposits_path
      expect(response).to have_http_status(200)
    end
  end
end
