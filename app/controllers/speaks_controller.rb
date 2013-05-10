# coding: utf-8

class SpeaksController < ApplicationController
  permits :text
  load_and_authorize_resource

  # GET /speaks
  def index
    @speaks = @speaks
    case params[:order]
    when 'votes'
      @speaks = @speaks.joins("left join votes on speaks.id = votes.votable_id and votes.votable_type='Speak'").group('speaks.id, votes.votable_id').order('count(speaks.id) DESC')
    else
      @speaks = @speaks.includes(:votes).order("created_at DESC")
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
    if @speak.save
      redirect_to @speak, notice: I18n.t("helpers.notices.created", model: Speak.model_name.human)
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
      format.js { head :ok }
    end
  end
end
