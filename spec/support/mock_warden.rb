module MockWarden
  def not_logged_in
    request.env['warden'] = mock(:authenticated? => false, :user => nil)
  end
  
  def logged_in_as(user)
    request.env['warden'] = mock(:authenticated? => true, :user => user)
  end
end