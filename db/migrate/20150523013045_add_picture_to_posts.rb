class AddPictureToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :picture
  end
end
