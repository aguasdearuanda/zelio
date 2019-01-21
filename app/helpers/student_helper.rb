module StudentHelper
  def label_for_active(active)
    if active
      content_tag(:span, 'Ativado', class: 'btn btn-success btn-sm btn-rounded')
    else
      content_tag(:span, 'Desativado', class: 'btn btn-danger btn-sm btn-rounded')
    end
  end
end
