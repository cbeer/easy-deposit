require 'rails_helper'

RSpec.describe 'deposits/new', type: :view do
  before(:each) do
    assign(:deposit, Deposit.new(
                       title: 'MyString'
    ))
  end

  it 'renders new deposit form' do
    render

    assert_select 'form[action=?][method=?]', deposits_path, 'post' do
      assert_select 'input#deposit_title[name=?]', 'deposit[title]'
    end
  end
end
