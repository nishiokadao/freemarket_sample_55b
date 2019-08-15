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
  link "ログアウト", signout_users_path
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

crumb :liked do
  link "いいね！一覧", liked_index_users_path(current_user)
  parent :mypage
end