class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def path_photoid
    url_photoid = params.fetch("path_photoid")
    matching_photos = Photo.where({ :id => url_photoid})
    @the_photo = matching_photos.first

    if @the_photo == nil
      redirect_to ("/404")
    else
    render({ :template => "photo_templates/path_photoid.html.erb" })
    end
  end

  def delete_photoid
    delete_id = params.fetch("delete_photoid")
    matching_delete_photo = Photo.where({ :id => delete_id})
    deleted_photo = matching_delete_photo.first
    deleted_photo.destroy
    redirect_to("/photos")
  end

  def include_photo

    newpic = Photo.new

    newpic.id 
    newpic.caption = params.fetch("input_caption")
    newpic.image = params.fetch("input_image")
    newpic.owner_id = params.fetch("input_owner_id")
    newpic.save
    redirect_to("/photos")
  end
end
