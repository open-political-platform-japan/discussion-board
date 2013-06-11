# coding: utf-8

class SpeaksController < ApplicationController
  permits :text
  load_and_authorize_resource except: :index

  # GET /speaks
  def index
    @q = Speak.includes(:user, :votes).search(params[:q])
    if params[:q]
      @q = Speak.includes(:user).search(params[:q])
      @speaks = @q.result(:distinct => true)
    elsif params[:order] == 'votes'
      @speaks = Speak.includes(:user, :votes).order('cached_votes_score DESC, created_at DESC')
      @speaks = @speaks.where("? <= id", Configurable.speak_from) if Configurable.speak_from.to_i > 0
    else
      @speaks = Speak.includes(:votes, user: :votes).order("created_at DESC")
    end
  end

  # GET /speaks/1
  def show(id)
  end

  # GET /speaks/new
  def new
  end

  # GET /speaks/1/edit
  def edit(id)
  end

  # POST /speaks
  def create(speak)
    if Speak.where(user_id: current_user.id).where("? < created_at", Configurable.speak_limit_per_minutes.minutes.ago).count > Configurable.speak_limit_counts
      return render action: :new
    end
    if @speak.save
      redirect_to speaks_path, notice: "発言しました"
    else
      render action: 'new'
    end
  end

  # PUT /speaks/1
  def update(id, speak)
    if @speak.update_attributes(speak)
      redirect_to @speak, notice: I18n.t("helpers.notices.updated", model: Speak.model_name.human)
    else
      render action: 'edit'
    end
  end

  def vote(id)
    if params[:cancel]
      current_user.unvote_for @speak
      notice = "下げました。"
    else
      current_user.upvotes @speak
      notice = "上げました。"
    end
    respond_to do |format|
      format.html { redirect_to @speak, notice: notice }
      format.js
    end
  end
end
