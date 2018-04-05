# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @search_developer_form = SearchDeveloperForm.new
  end

  def search
    @search_developer_form = SearchDeveloperForm.new(search_developer_params)
    @developers = @search_developer_form.search

    render :index
  end

  private

  def search_developer_params
    params.require(:search_developer_form).permit(:programming_language_id, :language_id)
  end
end
