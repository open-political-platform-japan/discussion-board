module ApplicationHelper
  def vote_icon(speak)
    return unless can? :vote, speak
    if current_user.liked? speak
      link_to glyph(:thumbs_up), vote_speak_path(speak, cancel: true), method: :post
    else
      link_to glyph(:thumbs_up, :gray), vote_speak_path(speak), method: :post
    end
  end
end
