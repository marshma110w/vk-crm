module Api
  class VkController < ActionController::API
    GROUP_ID = 201246423

    before_action :authenticate_api

    # Чтобы рубокоп не ругался на длинный метод
    # rubocop:disable Metrics/AbcSize
    def action
      case params[:type]
      when 'confirmation'
        head 400 if params[:group_id] != GROUP_ID
        render json: ENV['VK_CONFIRMATION_KEY']

      when 'message_new'
        if Message.create_from_vk(params[:object][:message])
          render json: 'ok'
        else
          Rails.logger.fatal('Message not created')
        end
      else
        Rails.logger.warn("Unhandled action: #{params[:type]}")
        render json: 'ok'
      end
    end
    # rubocop:enable Metrics/AbcSize

    private

    def authenticate_api
      head 401 if params[:secret] != ENV['VK_API_KEY']
    end
  end
end
