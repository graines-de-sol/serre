FactoryGirl.define do

  factory :blog_category do
    sequence (:name) {|n| "category #{n}"}
  end

  factory :post do

    sequence (:title) {|n| "post number #{n}"}
    sequence (:content) {|n| "<p>This is a post content number #{n}</p>"}
    sequence (:blog_category_id) {|n| n}
    is_published true
    sequence (:published_at) {|n| Time.now - n.month}

    blog_category
  end

end

