class ExclusiveCamerasController < ApplicationController
  # GET /exclusive_cameras
  # GET /exclusive_cameras.json
  def index
    @exclusive_cameras = ExclusiveCamera.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exclusive_cameras }
    end
  end

  # GET /exclusive_cameras/1
  # GET /exclusive_cameras/1.json
  def show
    @exclusive_camera = ExclusiveCamera.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exclusive_camera }
    end
  end

  # GET /exclusive_cameras/new
  # GET /exclusive_cameras/new.json
  def new
    @exclusive_camera = ExclusiveCamera.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exclusive_camera }
    end
  end

  # GET /exclusive_cameras/1/edit
  def edit
    @exclusive_camera = ExclusiveCamera.find(params[:id])
  end

  # POST /exclusive_cameras
  # POST /exclusive_cameras.json
  def create
    @exclusive_camera = ExclusiveCamera.new(params[:exclusive_camera])

    respond_to do |format|
      if @exclusive_camera.save
        format.html { redirect_to @exclusive_camera, notice: 'Exclusive camera was successfully created.' }
        format.json { render json: @exclusive_camera, status: :created, location: @exclusive_camera }
      else
        format.html { render action: "new" }
        format.json { render json: @exclusive_camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exclusive_cameras/1
  # PUT /exclusive_cameras/1.json
  def update
    @exclusive_camera = ExclusiveCamera.find(params[:id])

    respond_to do |format|
      if @exclusive_camera.update_attributes(params[:exclusive_camera])
        format.html { redirect_to @exclusive_camera, notice: 'Exclusive camera was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exclusive_camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exclusive_cameras/1
  # DELETE /exclusive_cameras/1.json
  def destroy
    @exclusive_camera = ExclusiveCamera.find(params[:id])
    @exclusive_camera.destroy

    respond_to do |format|
      format.html { redirect_to exclusive_cameras_url }
      format.json { head :no_content }
    end
  end
end
