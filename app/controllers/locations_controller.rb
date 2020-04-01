class LocationsController < ApplicationController

  def new
    @location = Location.new
  end
  def create
    @location = Location.new
    if @location.save
      redirect_to root_path, notice: "new location!"
    else
      render :new
    end
  end
  def show
    @locations = Location.order(:name)
    @location = Location.find(params[:id])
    @eggs = Dragon.where("location_id = ? AND account_id = ?", params[:id], 0)
    # testing: coast eggs
    if @eggs.size < 3 and
      des = dragon_description
      nam = generate_name
      Dragon.create(account_id: 0, location_id: params[:id], name: nam, description: des)
    end
    p "#{@eggs.size}"
  end

  def pikeup
    @id = params[:id]
    Dragon.find(params[:id]).update(account_id: current_account.id)
  end

  private
  def dragon_description

    coast = [
        "This egg has an orange aura radiating from it.",
        "This egg is tiny and made out of several pieces of paper folded together.",
        "This light egg is floating in the air.",
        "This egg has a faint green glow around it.",
        "It's bright. And pink.",
        "This egg is soft and smells uncannily like cheese.",
        "This egg reminds you of the sea."
    ]

    if @location.name == 'Coast'
      return coast.sample
    else
      return nil
    end

  end
  def generate_name
    a = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"]
    return a.shuffle.sample(5).join
  end

end
