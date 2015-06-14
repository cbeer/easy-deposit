require 'rails_helper'

RSpec.describe PartsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/deposits/1/parts').to route_to('parts#index', deposit_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/deposits/1/parts/new').to route_to('parts#new', deposit_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/deposits/1/parts/1').to route_to('parts#show', deposit_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/deposits/1/parts/1/edit').to route_to('parts#edit', deposit_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/deposits/1/parts').to route_to('parts#create', deposit_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/deposits/1/parts/1').to route_to('parts#update', deposit_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/deposits/1/parts/1').to route_to('parts#update', deposit_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/deposits/1/parts/1').to route_to('parts#destroy', deposit_id: '1', id: '1')
    end
  end
end
