class SkillTopicsController < ApplicationController
  protect_from_forgery
  before_action :set_skill_topic, only: [:show, :edit, :update, :destroy]

  # GET /skill_topics
  # GET /skill_topics.json
  def index
    @skill_topics = SkillTopic.all
  end


  # GET /skill_topics/new
  def new
    @skill_topic = SkillTopic.new
  end

  # GET /skill_topics/1/edit
  def edit
  end

  # POST /skill_topics
  # POST /skill_topics.json
  def create
    @skill_topic = SkillTopic.new(skill_topic_params)

    respond_to do |format|
      if @skill_topic.save
        format.html { redirect_to @skill_topic, notice: 'Skill topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @skill_topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @skill_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_topics/1
  # PATCH/PUT /skill_topics/1.json
  def update
    respond_to do |format|
      if @skill_topic.update(skill_topic_params)
        format.html { redirect_to @skill_topic, notice: 'Skill topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @skill_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_topics/1
  # DELETE /skill_topics/1.json
  def destroy
    @skill_topic.destroy
    respond_to do |format|
      format.html { redirect_to skill_topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_topic
      @skill_topic = SkillTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_topic_params
      params.require(:skill_topic).permit(:name)
    end
end
