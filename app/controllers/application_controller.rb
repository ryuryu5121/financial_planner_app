class ApplicationController < ActionController::Base
  include SessionsHelper
  include FpSessionsHelper
  include SchedulesHelper
end
