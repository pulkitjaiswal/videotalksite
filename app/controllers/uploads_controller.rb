class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {} }
    end
  end
end
