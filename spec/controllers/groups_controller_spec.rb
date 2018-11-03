require 'rails_helper'

RSpec.describe Admin::GroupsController, type: :controller do

  describe '#index' do
    context 'when has group' do
      it 'lists all groups' do
      end
    end

    context 'when has no group' do
      it 'shows a message' do
      end
    end
  end

  describe '#new' do
    it 'creates a group' do
    end
  end

  describe '#delete' do
    it 'deletes a group' do
    end
  end
end
