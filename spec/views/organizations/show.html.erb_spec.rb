require 'rails_helper'

RSpec.describe 'organizations/show', type: :view do
  before(:each) { @organization = assign(:organization, Organization.create!) }

  it 'renders attributes in <p>' do
    render
  end
end
