require 'rails_helper'

RSpec.describe 'deposits/edit', type: :view do
  before(:each) do
    @deposit = assign(:deposit, Deposit.create!(
                                  title: 'MyString'
    ))
  end

  it 'renders the edit deposit form' do
    render

    assert_select 'form[action=?][method=?]', deposit_path(@deposit), 'post' do
      assert_select 'input#deposit_title[name=?]', 'deposit[title]'
    end
  end
end
