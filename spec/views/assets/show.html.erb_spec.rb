require 'rails_helper'

RSpec.describe 'assets/show', type: :view do
  before(:each) { @asset = assign(:asset, Fabricate(:asset)) }

  it 'renders attributes in <p>' do
    render
  end
end
