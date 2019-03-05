# frozen_string_literal: true

module JustificationHelper
  def label_for_status(status)
    if status == 'aceito'
      content_tag(:span, status, class: 'btn btn-success btn-sm')
    elsif status == 'pendente'
      content_tag(:span, status, class: 'btn btn-warning btn-sm')
    else
      content_tag(:span, status, class: 'btn btn-danger btn-sm')
    end
  end
end
