class ApplicationController < ActionController::API

  def index
    render :json => '{ msg: "Are you ready for api battle :)" }'
  end
  
  def catch_404
    render :json => '{ msg: "The route is not defined! :p" }'
  end

end
