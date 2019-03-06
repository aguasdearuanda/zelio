require 'rails_helper'

RSpec.describe JustificationHelper, type: :helper do
  describe '#label_for_status' do
    it 'changes button when status was active' do
      expect(helper.label_for_status('aceito')).to eq \
        '<span class="btn btn-success btn-sm">aceito</span>'
    end

    it 'changes button when status was pending' do
      expect(helper.label_for_status('pendente')).to eq \
        '<span class="btn btn-warning btn-sm">pendente</span>'
    end

    it 'changes button when status was anything else' do
      expect(helper.label_for_status('')).to eq \
        '<span class="btn btn-danger btn-sm"></span>'
    end
  end
end
