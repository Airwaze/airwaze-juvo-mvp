class UsersController < ApplicationController
  view_accessor :resource

  before_action :authenticate_user!, except: [:sign_in_as_merchant, :sign_in_as_bank]

  def show
    only_for_users! :regular

    self.resource = current_user
  end

  def sign_in_as_merchant
    sign_in(User.merchant.first)

    redirect_to root_path
  end

  def sign_in_as_bank
    sign_in(User.bank.first)

    redirect_to root_path
  end
end
