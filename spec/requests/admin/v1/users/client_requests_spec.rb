# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::V1::Users as :client', type: :request do
  let(:logged_user) { create(:user, profile: :client) }

  context 'GET /users' do
    let(:url) { '/admin/v1/users' }
    let!(:users) { create_list(:user, 5) }

    before(:each) { get url, headers: auth_header(logged_user) }

    include_examples 'forbidden access'
  end

  context 'POST /users' do
    let(:url) { '/admin/v1/users' }

    before(:each) { post url, headers: auth_header(logged_user) }

    include_examples 'forbidden access'
  end

  context 'PATCH /users/:id' do
    let(:url) { "/admin/v1/users/#{user.id}" }
    let(:user) { create(:user) }

    before(:each) { patch url, headers: auth_header(logged_user) }

    include_examples 'forbidden access'
  end

  context 'DELETE /users/:id' do
    let(:url) { "/admin/v1/users/#{user.id}" }
    let(:user) { create(:user) }

    before(:each) { delete url, headers: auth_header(logged_user) }

    include_examples 'forbidden access'
  end
end
