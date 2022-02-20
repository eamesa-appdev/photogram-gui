Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index" })
  get("/users", {:controller => "users", :action => "index" })
  get("/users/:path_username", {:controller => "users", :action => "path_username" })

  get("/photos", {:controller => "photos", :action => "index" })
  #get("/users/:path_username", {:controller => "users", :action => "path_username" })

end