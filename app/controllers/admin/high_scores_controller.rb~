class Admin::HighScoresController < ApplicationController
  # GET /admin/high_scores
  # GET /admin/high_scores.json
  def index
    @admin_high_scores = Admin::HighScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_high_scores }
    end
  end

  # GET /admin/high_scores/1
  # GET /admin/high_scores/1.json
  def show
    @admin_high_scores = Admin::HighScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_high_score }
    end
  end

  # GET /admin/high_scores/new
  # GET /admin/high_scores/new.json
  def new
    @admin_high_score = Admin::HighScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_high_score }
    end
  end

  # GET /admin/high_scores/1/edit
  def edit
    @admin_high_score = Admin::HighScore.find(params[:id])
  end

  # POST /admin/high_scores
  # POST /admin/high_scores.json
  def create
    @admin_high_score = Admin::HighScore.new(params[:admin_high_score])

    respond_to do |format|
      if @admin_high_score.save
        format.html { redirect_to @admin_high_score, notice: 'High score was successfully created.' }
        format.json { render json: @admin_high_score, status: :created, location: @admin_high_score }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_high_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/high_scores/1
  # PUT /admin/high_scores/1.json
  def update
    @admin_high_score = Admin::HighScore.find(params[:id])

    respond_to do |format|
      if @admin_high_score.update_attributes(params[:admin_high_score])
        format.html { redirect_to @admin_high_score, notice: 'High score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_high_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/high_scores/1
  # DELETE /admin/high_scores/1.json
  def destroy
    @admin_high_score = Admin::HighScore.find(params[:id])
    @admin_high_score.destroy

    respond_to do |format|
      format.html { redirect_to admin_high_scores_url }
      format.json { head :no_content }
    end
  end
end
