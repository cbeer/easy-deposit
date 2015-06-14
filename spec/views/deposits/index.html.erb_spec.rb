require 'rails_helper'

RSpec.describe 'deposits/index', type: :view do
  before(:each) do
    assign(:deposits, [
      Deposit.create!(
        title: 'Title'
      ),
      Deposit.create!(
        title: 'Title'
      )
    ])
  end

  it 'renders a list of deposits' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
  end
end
