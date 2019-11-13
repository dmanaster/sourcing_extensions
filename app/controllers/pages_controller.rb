class PagesController < ApplicationController
  def splash
    if current_user.admin?
      redirect_to(extensions_path)
    end
  end
end
