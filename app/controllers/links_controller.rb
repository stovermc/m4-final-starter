class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login

  def index
    @link = Link.new
  end

  def create
    user = current_user
    link = user.links.new(link_params)
    if link.save
      render partial: 'shared/new_link', locals: { link: link }, layout: false
    else
      render partial: "shared/errors", locals: { target: link }
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = "Link has been updated."
      redirect_to root_path
    else
      # render partial: "shared/errors", locals: { target: @link }, layout: false
      render :edit
    end
  end

  private
    def link_params
      params.require(:link).permit(:url, :title)
    end
end
