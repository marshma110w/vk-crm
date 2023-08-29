# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # TODO: временно разрешаем всем ходить в наш API
    # Как только развернем фронт на сервере, нужно будет доработать конфигурацию
    origins '*'
    resource '*', headers: :any, methods: %i[get post]
  end
end
