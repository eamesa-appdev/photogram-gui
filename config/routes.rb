Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index" })
  get("/users", {:controller => "users", :action => "index" })
  get("/users/:path_username", {:controller => "users", :action => "path_username" })

  get("/include_user",{ :controller => "users", :action => "include_user"})
  get("/update_user/:update_userid",{ :controller => "users", :action => "edit_user"})

  get("/photos", {:controller => "photos", :action => "index" })
  get("/photos/:path_photoid", {:controller => "photos", :action => "path_photoid" })

  get("/delete_photo/:delete_photoid", {:controller => "photos", :action => "delete_photoid" })
  get("/include_photo", {:controller => "photos", :action => "include_photo" })
  get("/update_photo/:edit_photoid", {:controller => "photos", :action => "edit_photo" })
  
end