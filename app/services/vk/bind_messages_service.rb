# frozen_string_literal: true

module Vk
  class BindMessagesService
    VK_API_URL = 'https://api.vk.com/method'
    VK_API_VERSION = '5.131'
    PLATFORM_ID = 1

    attr_reader :external_user_id, :message_body

    def initialize(external_user_id:, message_body:)
      @external_user_id = external_user_id
      @message_body = message_body
    end

    def perform
      client = find_or_create_client
      client.messages.create!(body: message_body, chat_id: 1) # Пока хардкодим чат, чтоб создать уже наконец сообщение
    rescue StandardError => e
      Rails.logger.fatal(e)
    end

    private

    def find_or_create_client
      client = Client.joins(:platformings).find_by(platformings: { external_user_id: })
      return client if client

      return unless external_user

      ActiveRecord::Base.transaction do
        client = Client.create(name: "#{external_user['first_name']} #{external_user['last_name']}")
        client.platformings.create(platform_id: PLATFORM_ID, external_user_id:)
      end
      client
    end

    def external_user
      return @external_user if @external_user

      response = HTTParty.get("#{VK_API_URL}/users.get",
                              query: { user_ids: external_user_id, access_token:, v: VK_API_VERSION })
      return unless response.code == 200

      @external_user = response['response'].first
    end

    def access_token
      ENV['VK_ACCESS_TOKEN']
    end
  end
end
