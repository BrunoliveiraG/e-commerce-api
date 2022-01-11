# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::V1::Licenses without authentication', type: :request do
  context 'GET /licenses' do
    let(:url) { '/admin/v1/licenses' }
    let!(:licenses) { create_list(:license, 5) }

    before(:each) { get url }

    include_examples 'unauthenticated access'
  end

  context 'POST /licenses' do
    let(:url) { '/admin/v1/licenses' }

    before(:each) { post url }

    include_examples 'unauthenticated access'
  end

  context 'PATCH /licenses/:id' do
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    let(:license) { create(:license) }

    before(:each) { patch url }

    include_examples 'unauthenticated access'
  end

  context 'DELETE /licenses/:id' do
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    let(:license) { create(:license) }

    before(:each) { delete url }

    include_examples 'unauthenticated access'
  end
end
