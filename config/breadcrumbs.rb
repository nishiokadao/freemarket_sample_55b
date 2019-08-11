crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :cards do
  link "支払い方法", credit_users_path
  parent :mypage
end

crumb :new_credit do
  link "クレジット情報入力", new_credit_path(current_user)
  parent :cards
end

crumb :new_product do
  link "商品出品画面", new_product_path
  parent :mypage
end

crumb :detil do
  link "本人情報の登録", detail_users_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :signout do
  link "ログアウト", psignout_users_path
  parent :mypage
end

crumb :item_state do
  link "出品した商品-出品中", item_state_users_path
  parent :mypage
end

crumb :exhibit do
  link "出品商品画面", exhibit_products_path
  parent :item_state
end

# crumb : do
#   link "", profile_index_path
#   parent :
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
