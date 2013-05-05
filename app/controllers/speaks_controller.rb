# coding: utf-8

class SpeaksController < ApplicationController
  permits :text
  load_and_authorize_resource

  # GET /speaks
  def index
    @speaks = @speaks.order("created_at DESC")
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
      redirect_to @speak, notice: '発言を作成しました。'
    else
      render action: 'new'
    end
  end

  # PUT /speaks/1
  def update(id, speak)
    if @speak.update_attributes(speak)
      redirect_to @speak, notice: '発言を更新しました。'
    else
      render action: 'edit'
    end
  end

  # DELETE /speaks/1
  def destroy(id)
    @speak.destroy

    respond_to do |format|
      format.html { redirect_to speaks_url, notice: "発言を削除しました。" }
      format.js { head :ok }
    end
  end
end
