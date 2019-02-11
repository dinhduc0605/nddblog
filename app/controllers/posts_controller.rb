# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show clap]
  protect_from_forgery with: :null_session, only: :clap

  def show; end

  def clap
    respond_to do |format|
      format.html
      format.js do
        if @post.update(clap_count: @post.clap_count + 1)
          render json: {message: 'successful'}, status: :ok
        else
          render json: {message: 'failed'}, status: :internal_server_error
        end
      end
    end
  end

  private

  def set_post
    @post = Post.published.friendly.find params[:id]
  end
end
