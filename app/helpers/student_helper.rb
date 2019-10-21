# frozen_string_literal: true

module StudentHelper
  def label_for_active(active)
    if active
      content_tag(:span, 'Ativado', class: 'btn btn-success btn-sm btn-rounded')
    else
      content_tag(:span, 'Desativado', class: 'btn btn-danger btn-sm btn-rounded')
    end
  end

  def label_for_klass_student_status(active)
    if active == 'ativo'
      content_tag(:span, 'Ativado', class: 'btn btn-success btn-sm btn-rounded')
    else
      content_tag(:span, 'Desativado', class: 'btn btn-danger btn-sm btn-rounded')
    end
  end

  def klasses(student, attendances, klass)
    student.show_attendances(attendances, klass.id)
  end

  def absences(student, attendances, klass)
    student.count_presence(attendances, klass.id)
  end

  def justifications(student, klass)
    student.check_justifications(klass.id, student.email)
  end
end
