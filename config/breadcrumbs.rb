crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parentr :root
end

crumb :cards do
  link "支払い方法", user_credit_path
  parent :mypage
end

crumb : do
  link "クレジット情報入力", users_sign_up_forth_path
  parent :cards
end

crumb : do
  link "商品出品画面", products_new_path
  parent :mypage
end

crumb : do
  link "本人情報登録", profile_index_path
  parent :mypage
end

crumb : do
  link "", profile_index_path
  parent :
end

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
