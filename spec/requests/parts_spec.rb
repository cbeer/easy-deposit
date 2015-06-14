require 'rails_helper'

RSpec.describe 'Parts', type: :request do
  let(:deposit) { Deposit.create! }
  before do
    sign_in_as_a_valid_user
  end

  describe 'GET /parts' do
    it 'works! (now write some real specs)' do
      get deposit_parts_path(deposit)
      expect(response).to have_http_status(200)
    end
  end
end
