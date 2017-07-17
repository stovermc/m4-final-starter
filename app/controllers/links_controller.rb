class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
  end

  def create
    user = current_user
    link = user.links.new(link_params)
    if link.save
      render partial: 'shared/new_link', layout: false
    end
  end
end
