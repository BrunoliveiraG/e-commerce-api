# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::V1::Licenses as :admin', type: :request do
  let(:user) { create(:user) }

  context 'GET /licenses' do
    let(:url) { '/admin/v1/licenses' }
    let!(:licenses) { create_list(:license, 5) }

    it 'returns all licenses' do
      get url, headers: auth_header(user)
      expect(body_json['licenses']).to contain_exactly(*licenses.as_json(only: %i[id key game_id user_id]))
    end

    it 'returns success status' do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  end

  context 'POST /licenses' do
    let(:url) { '/admin/v1/licenses' }

    context 'with valid params' do
      let(:license_params) { { license: attributes_for(:license) }.to_json }

      it 'adds a new License' do
        expect do
          post url, headers: auth_header(user), params: license_params
        end.to change(License, :count).by(1)
      end

      it 'returns last added User' do
        post url, headers: auth_header(user), params: license_params
        expect_license = License.last.as_json(only: %i[id key game_id user_id])
        expect(body_json['license']).to eq expect_license
      end

      it 'returns success status' do
        post url, headers: auth_header(user), params: license_params
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:license_invalid_params) do
        { license: attributes_for(:license, key: nil) }.to_json
      end

      it 'does not add a new License' do
        expect do
          post url, headers: auth_header(user), params: license_invalid_params
        end.to_not change(License, :count)
      end

      it 'returns error messages' do
        post url, headers: auth_header(user), params: license_invalid_params
        expect(body_json['errors']['fields']).to have_key('key')
      end

      it 'returns unprocessable_entity status' do
        post url, headers: auth_header(user), params: license_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'PATCH /licenses/:id' do
    let(:license) { create(:license) }
    let(:url) { "/admin/v1/licenses/#{license.id}" }

    context 'with valid params' do
      let(:new_key) { Faker::Commerce.unique.promotion_code(digits: 15) }
      let(:license_params) { { license: { key: new_key } }.to_json }

      it 'updates License' do
        patch url, headers: auth_header(user), params: license_params
        license.reload
        expect(license.key).to eq new_key
      end

      it 'returns updated license' do
        patch url, headers: auth_header(user), params: license_params
        license.reload
        expect_license = license.as_json(only: %i[id key game_id user_id])
        expect(body_json['license']).to eq expect_license
      end

      it 'returns success status' do
        patch url, headers: auth_header(user), params: license_params
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:license_invalid_params) do
        { license: attributes_for(:license, key: nil) }.to_json
      end

      it 'does not update Licence' do
        old_key = license.key
        patch url, headers: auth_header(user), params: license_invalid_params
        license.reload
        expect(license.key).to eq old_key
      end

      it 'returns error messages' do
        patch url, headers: auth_header(user), params: license_invalid_params
        expect(body_json['errors']['fields']).to have_key('key')
      end

      it 'returns unprocessable_entity status' do
        patch url, headers: auth_header(user), params: license_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'DELETE /licenses' do
    let!(:license) { create(:license) }
    let(:url) { "/admin/v1/licenses/#{license.id}" }

    it 'removes License' do
      expect do
        delete url, headers: auth_header(user)
      end.to change(License, :count).by(-1)
    end

    it 'returns success status' do
      delete url, headers: auth_header(user)
      expect(response).to have_http_status(:no_content)
    end

    it 'does not return any body content' do
      delete url, headers: auth_header(user)
      expect(body_json).to_not be_present
    end
  end
end