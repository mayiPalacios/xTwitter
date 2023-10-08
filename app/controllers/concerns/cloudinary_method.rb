module CloudinaryMethod

    def upload(img_url)
        upload1=Cloudinary::Uploader.upload(img_url, 
            use_filename:true, 
            unique_filename:false,
            overwrite:true
            )
           

        upload1["url"]
    end


end