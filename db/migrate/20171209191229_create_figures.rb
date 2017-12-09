class CreateFigures < ActiveRecord::Migration
  def change
    create_tables :figures do |t|
      t.string :name
    end
  end
end
 
