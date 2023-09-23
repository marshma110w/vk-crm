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
      unless (client = find_or_create_client)
        Rails.logger.info("Failed to load message for client #{external_user_id}")
        return
      end
      client.messages.new(body: message_body, chat_id: 1).save(validate: false) # Пока забиваем на чат
    rescue StandardError => e
      Rails.logger.fatal(e)
    end

    private

    def find_or_create_client
      client = Client.find_by(external_id: external_user_id)
      return client if client
      return unless external_user

      Client.create(name: "#{external_user['first_name']} #{external_user['last_name']}",
                    platform_id: PLATFORM_ID,
                    external_id: external_user_id)
    end

    def external_user
      return @external_user if @external_user

      response = HTTParty.get("#{VK_API_URL}/users.get",
                              query: { user_ids: external_user_id, access_token:, v: VK_API_VERSION })
      return unless response.code == 200

      @external_user = response['response']&.first
    end

    def access_token
      ENV['VK_ACCESS_TOKEN']
    end
  end
end
