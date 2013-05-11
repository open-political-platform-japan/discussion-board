class Admin::SpeaksController < ApplicationController
  def download_all
    rows = []
    Speak.find_each do |speak|
      rows << [speak.id, speak.created_at, speak.text].join(",")
    end
    render text: rows.join("\n")
  end
end
