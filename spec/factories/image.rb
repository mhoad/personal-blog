FactoryGirl.define do
  factory :image do
    title 'Example Image'
    caption 'Example Image Caption'
    licence 'https://creativecommons.org/publicdomain/zero/1.0/'
    geo_location 'New York, USA'
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'ab-test-results.png')) }
  end
end
