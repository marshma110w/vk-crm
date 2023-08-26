# frozen_string_literal: true

class HelloController < ApplicationController
  def show
    @current_date = Date.current
  end
end
