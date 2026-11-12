require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "requires a title" do
    user = User.create!(name: "Test User", email: "test@example.com", password: "password123")
    project = user.projects.create!(name: "Projekt testowy")
    task = project.tasks.new(title: "", status: "todo", priority: "medium")
    assert_not task.valid?
  end
end
