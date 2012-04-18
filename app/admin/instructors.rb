ActiveAdmin.register Instructor do

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :profile_picture, as: :file
    end
    f.inputs "Content" do
      f.input :bio
    end
    f.buttons
  end
  
end
