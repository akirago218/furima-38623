class ItemsController < ApplicationController

  def index

  end

 praivate

 def message_params
   params.require(:item).permit(:content, :image).merge(user_id: curret_user.id)
 end

end