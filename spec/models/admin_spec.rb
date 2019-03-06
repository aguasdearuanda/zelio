# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create(:admin) }
  it 'validates admin' do
    expect(admin.valid_password?('1234567890')).to be_truthy
  end
end
