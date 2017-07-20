require "bundler/setup"
require_relative 'todo'

Bundler.require # this line will require all the gems in Gemfile

get "/lines" do
  @todo = Todo.new("todo.data")
  # your code here: print out the lines to the screen
  'Hello World!'
end