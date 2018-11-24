# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Groups management', type: :request do
  before do
    sign_in admin
  end

  let(:admin) { create(:admin) }
  describe '#index' do
    context 'when has group' do
      let(:groups) { create_list(:group, 3) }
      it 'lists all groups' do
        get admin_groups_path
        expect(groups.count).to be_equal(3)
      end
    end
  end

  describe '#new' do
    context 'when is success' do
      it 'creates a group' do
        get new_admin_group_path
        group = build(:group)
        group.save
        expect(response).to be_success
      end
    end

    context 'when is fail' do
      it 'fails to create a group' do
        group = Group.new
        group.save
        binding.pry
        # expect(response).to fail
      end
    end
  end

  describe '#delete' do
    it 'deletes a group' do
    end
  end
end
