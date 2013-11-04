Fabricator(:meal) do
	user_id [1,2,3,4,5].sample
	picture {
    ActionDispatch::Http::UploadedFile.new(
      :tempfile => File.new(Rails.root.join("spec/fixtures/assets/meal.png")),
      :filename => File.basename(File.new(Rails.root.join("spec/fixtures/assets/meal.png")))
    )
  }
end