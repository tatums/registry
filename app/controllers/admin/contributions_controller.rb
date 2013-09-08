class Admin::ContributionsController < ApplicationController
  respond_to :html
  def index
    @contributions = Contribution.all
  end
end
