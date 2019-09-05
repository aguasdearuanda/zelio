# frozen_string_literal: true

class StudentController < ApplicationController
  before_action :authenticate_student!
  layout 'internal'
end
