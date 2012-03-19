class Api::NamespaceController < ApplicationController
  rescue_from ActiveModel::MassAssignmentSecurity::Error do |error|
    render :json => {:error => "mass_assignment", :message => "The record had fields that should not have been defined."} and return
  end
  
  rescue_from ActiveRecord::RecordNotUnique do |error|
    render :json => {:error => "record_not_unique", :message => "The record did not have a unique field where required."}
  end
  
  protected
  
  def check_authentication
    unless warden.authenticated?
      render :json => {:error => "unauthorized", :message => "You have to login before you can access your task list."} and return
    end
  end
end