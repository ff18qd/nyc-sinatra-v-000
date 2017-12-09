class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_tables :figure_titles do |t|
      t.integer :figure_id
      t.integer :title_id
    end
  end
end
