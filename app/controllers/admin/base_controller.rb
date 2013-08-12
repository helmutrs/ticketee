class Admin::BaseController  < ApplicationController
  # To change this template use File | Settings | File Templates.
  before_filter :authorize_admin! # this base controller will run before any controller on the namespace "admin".

  def index

  end
end