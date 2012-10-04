class AddXlsFileToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :xls_file, :string
  end
end
