class DragonsController < ApplicationController

  def index
    @dragons = current_account.dragons
  end

  private


end
