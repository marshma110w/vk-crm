# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Vk::BindMessagesService, webmock: true do
  context 'if vk returns 200ok' do
    context 'if message is from new client' do
      let(:new_client_external_id) { 1234 }
      let(:vk_users_good_response) do
        {
          response: [{
            id: new_client_external_id,
            first_name: 'Ivan',
            last_name: 'Ivanov',
            can_access_closed: true,
            is_closed: false
          }]
        }.to_json
      end

      before do
        stub_request(:get, 'https://api.vk.com/method/users.get?access_token=&user_ids=1234&v=5.131')
          .to_return(status: 200, body: vk_users_good_response, headers: { 'Content-Type' => 'application/json' })
      end

      it 'creates new client and message' do
        expect do
          described_class.new(external_user_id: new_client_external_id, message_body: 'test').perform
        end.to change(Client, :count).by(1).and change(Message, :count).by(1)
      end
    end

    context 'if message is from existing client' do
      let(:existing_client_external_id) { 4321 }

      it 'does not create new client' do
        expect do
          described_class.new(external_user_id: existing_client_external_id, message_body: 'test').perform
        end.not_to change(Client, :count)
      end
    end
  end
end
