class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

<<<<<<< HEAD
=======
  def only_for_users!(*user_kinds)
    redirect_to root_path unless user_kinds.include?(current_user.kind.to_sym)
  end

>>>>>>> airwaze-mvp/master
  def self.view_accessor(*names)
    attr_accessor *names
    helper_method *names
  end
end
