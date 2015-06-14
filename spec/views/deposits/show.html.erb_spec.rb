require 'rails_helper'

RSpec.describe 'deposits/show', type: :view do
  before(:each) do
    @deposit = assign(:deposit, Deposit.create!(
                                  title: 'Title',
                                  metadata: { some: 'MyText' }
    ))
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
