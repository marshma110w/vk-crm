class HelloController < ApplicationController
  def show
    @current_date = Date.current
  end
end
