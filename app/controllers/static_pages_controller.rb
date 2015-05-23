class StaticPagesController < ApplicationController
  def index
    render layout: "home"
  end
end
