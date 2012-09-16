FactoryGirl.define do
  factory :conf do
    default_location_id 1
    default_avatar_uid 'default_avatar.jpg'
    max_surveys 20
    headline_published false
    newsletter_header_uid 'default_header.png'
    max_post_on_index 3
  end
end

