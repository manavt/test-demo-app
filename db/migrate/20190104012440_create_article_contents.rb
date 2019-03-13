class CreateArticleContents < ActiveRecord::Migration[5.1]
  def change
    create_table :article_contents do |t|
      t.string :content
      t.belongs_to :article, foreign_key: true

      t.timestamps
    end
  end
end
