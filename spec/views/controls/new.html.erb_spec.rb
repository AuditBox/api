require 'rails_helper'

RSpec.describe 'controls/new', type: :view do
  before(:each) { assign(:control, Control.new) }

  it 'renders new control form' do
    render

    assert_select 'form[action=?][method=?]', controls_path, 'post' do
    end
  end
end
