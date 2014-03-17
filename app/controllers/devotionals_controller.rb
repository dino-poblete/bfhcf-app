class DevotionalsController < ApplicationController
  before_action :set_devotional, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:list, :new, :show, :edit, :update, :destroy]

  # GET /devotionals
  # GET /devotionals.json
  def index
    @devotionals = Devotional.all
  end


  def list
    @devotionals = Devotional.paginate(page: params[:page])
  end

  # GET /devotionals/1
  # GET /devotionals/1.json
  def show
    @devotional = Devotional.find(params[:id])
  end

  # GET /devotionals/new
  def new
    @devotional = Devotional.new
  end

  # GET /devotionals/1/edit
  def edit
    @devotional = Devotional.find(params[:id])
  end

  # POST /devotionals
  # POST /devotionals.json
  def create
    @devotional = Devotional.new(devotional_params)

    respond_to do |format|
      ##@devotional = current_user.devotional.build(devotional_params)
      #if @devotional.save
      #  flash[:success] = "Devotional created!"
      #  redirect_to root_url
      #else
      #  render 'new'
      #end

      if @devotional.save
        format.html { redirect_to @devotional, notice: 'Devotional was successfully created.' }
        format.json { render action: 'show', status: :created, location: @devotional }
      else
        format.html { render action: 'new' }
        format.json { render json: @devotional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devotionals/1
  # PATCH/PUT /devotionals/1.json
  def update
    respond_to do |format|
      if @devotional.update(devotional_params)
        format.html { redirect_to @devotional, notice: 'Devotional was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @devotional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devotionals/1
  # DELETE /devotionals/1.json
  def destroy
    @devotional.destroy
    respond_to do |format|
      format.html { redirect_to list_devotional_url, notice: 'Devotiinal deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devotional
      @devotional = Devotional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def devotional_params
      params.require(:devotional).permit(:title, :subtitle, :posted_at, :content, :user_id)
    end
end
