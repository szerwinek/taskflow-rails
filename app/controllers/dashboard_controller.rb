class DashboardController < ApplicationController
  before_action :require_login

  def show
    @projects = current_user.projects.includes(:tasks).recent.limit(5)
    @tasks = current_user.tasks.includes(:project).order(created_at: :desc).limit(8)
    @project_count = current_user.projects.count
    @open_task_count = current_user.tasks.open_tasks.count
    @done_task_count = current_user.tasks.where(status: "done").count
  end
end
