class WalletsController < ApplicationController
  view_accessor :resources, :resource

  def index
    self.resources = Wallet.all
  end

  def show
    self.resource = Wallet.find(params[:id])
  end
end
