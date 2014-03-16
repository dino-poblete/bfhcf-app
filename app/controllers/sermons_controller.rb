class SermonsController < ApplicationController
  before_action :set_sermon, only: [:display, :show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:list, :display, :new, :edit, :update, :destroy]

  # GET /sermons
  # GET /sermons.json
  def index
    @sermons = Sermon.all
  end

  def list
    @sermons = Sermon.paginate(page: params[:page])
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
    @sermon = Sermon.find(params[:id])
  end

  def display
    @user = Sermon.find(params[:id])
  end


  # GET /sermons/new
  def new
    @sermon = Sermon.new
  end

  # GET /sermons/1/edit
  def edit
    @sermon = Sermon.find(params[:id])
  end

  # POST /sermons
  # POST /sermons.json
  def create
    @sermon = Sermon.new(sermon_params)

    respond_to do |format|
      if @sermon.save
        format.html { redirect_to @sermon, notice: 'Sermon was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sermon }
      else
        format.html { render action: 'new' }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sermons/1
  # PATCH/PUT /sermons/1.json
  def update
    respond_to do |format|
      if @sermon.update(sermon_params)
        format.html { redirect_to @sermon, notice: 'Sermon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermons/1
  # DELETE /sermons/1.json
  def destroy
    @sermon.destroy
    respond_to do |format|
      format.html { redirect_to list_sermons_url, notice: 'Sermon deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sermon
      @sermon = Sermon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_params
      params.require(:sermon).permit(:title, :subtitle, :content, :posted_at, :user_id)
    end
end
