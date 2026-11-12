module ApplicationHelper
  def task_status(status)
    labels = { "todo" => "Do zrobienia", "in_progress" => "W trakcie", "done" => "Ukończone" }
    content_tag(:span, labels.fetch(status, status), class: "pill #{status}")
  end
end
