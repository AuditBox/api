require 'rails_helper'

RSpec.describe 'controls/show', type: :view do
  let(:organization) { Fabricate(:organization) }
  let(:control) { Fabricate(:control, organization: organization) }
  before(:each) { @control = assign(:control, control) }

  it 'renders attributes in <p>' do
    render
  end
end
