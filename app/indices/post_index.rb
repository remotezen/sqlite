ThinkingSphinx::Index.define :post, :with => :active_record do
  indexes :body
  indexes :title
end

ThinkingSphinx::Index.define :comment, :with => :active_record do
  indexes :comment
end

ThinkingSphinx::Index.define :recipe, :with => :active_record do
  indexes content
  indexes main_ingredient
  indexes course
  indexes title
  indexes prep_time
  indexes cooking_time
end
