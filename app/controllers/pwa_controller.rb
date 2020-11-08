# frozen_string_literal: true

class PwaController < ApplicationController
  skip_forgery_protection

  def service_worker; end

  def manifest; end
end
