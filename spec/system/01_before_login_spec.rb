require 'rails_helper'

RSpec.describe '[STEP1]ユーザーログイン前のテスト', type: :system do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:tag) { create(:tag) }
  let!(:tag_map) { create(:tag_map, post: post, tag: tag) }
  let!(:post_comment) { create(:post_comment, post: post, user: user) }
  let!(:favorite) { create(:favorite, post: post, user: user) }

  describe 'トップページのテスト：ログインしていない状態' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'main-visualが表示される' do
        expect(page).to have_content 'main-visual'
      end
      it '人気の投稿が表示される' do
        expect(page).to have_content '人気の投稿'
      end
      # it 'タグリストが表示される' do
      #   expect(page).to have_content 'タグリスト'
      # end
      # it '投稿のタイトルのリンク先が正しい' do
      #   expect(page).to have_link post.title, href: post_path(post)
      # end
      # it '投稿の本文が表示される' do
      #   expect(page).to have_content post.body
      # end
      # it 'タグのリンク先が正しい' do
      #   expect(page).to have_link post.tag, href: tag_posts_path(tag_id: tag.id)
      # end
      # it 'ユーザー名のリンク先が正しい' do
      #   expect(page).to have_link post.user.name, href: user_path(post.user)
      # end
      # it 'コメント数のリンク先が正しい' do
      #   expect(page).to have_link post.post_comments.count, href: post_path(post)
      # end
      # it 'いいね数が表示される' do
      #   expect(page).to have_content post.favorites.count
      # end
    end
  end

  # describe 'ヘッダーのテスト：ログインしていない場合' do
  #   before do
  #     visit root_path
  #   end

  #   context '表示内容の確認' do
  #     it 'タイトルロゴが表示される' do
  #       expect(page).to have_content 'logo.jpeg'
  #     end
  #     it 'タイトルロゴがトップページへのリンクになっている' do
  #       expect(page).to have_link 'logo.jpeg', href: root_path
  #     end
  #     it '新規登録リンクが表示され、リンクの内容が正しい' do
  #       expect(page).to have_link '新規登録', href: new_user_registration_path
  #     end
  #     it 'ログインリンクが表示され、リンクの内容が正しい' do
  #       expect(page).to have_link 'ログイン', href: new_user_session_path
  #     end
  #   end
  # end

  # describe '新規登録ページのテスト' do
  #   before do
  #     visit new_user_registration_path
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/users/sign_up'
  #     end
  #     it '新規ユーザー登録と表示される' do
  #       expect(page).to have_content '新規ユーザー登録'
  #     end
  #     it 'ニックネームフォームが表示される' do
  #       expect(page).to have_field 'user[name]'
  #     end
  #     it 'メールアドレスフォームが表示される' do
  #       expect(page).to have_field 'user[email]'
  #     end
  #     it 'パスワードフォームが表示される' do
  #       expect(page).to have_field 'user[password]'
  #     end
  #     it '確認用パスワードフォームが表示される' do
  #       expect(page).to have_field 'user[password_confirmation]'
  #     end
  #     it '新規登録ボタンが表示される' do
  #       expect(page).to have_button '新規登録'
  #     end
  #   end

  #   context '新規登録成功のテスト' do
  #     before do
  #       fill_in 'user[name]', with: user.name
  #       fill_in 'user[email]', with: user.email
  #       fill_in 'user[password]', with: user.password
  #       fill_in 'user[password_confirmation]', with: user.password_confirmation
  #     end

  #     it '正しく登録される' do
  #       expect { click_button '新規登録' }.to change(User.all, :count).by(1)
  #     end
  #     it '新規登録後のリダイレクト先がトップページになっている' do
  #       click_button '新規登録'
  #       expect(current_path).to eq '/'
  #     end
  #   end
  # end

  # describe 'ログインページのテスト' do
  #   before do
  #     visit new_user_session_path
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/users/sign_in'
  #     end
  #     it 'ログインと表示される' do
  #       expect(page).to have_content 'ログイン'
  #     end
  #     it 'メールアドレスフォームが表示される' do
  #       expect(page).to have_field 'user[email]'
  #     end
  #     it 'パスワードフォームが表示される' do
  #       expect(page).to have_field 'user[password]'
  #     end
  #     it 'ログインボタンが表示される' do
  #       expect(page).to have_button 'ログイン'
  #     end
  #     it 'ニックネームフォームは表示されない' do
  #       expect(page).not_to have_field 'user[name]'
  #     end
  #   end

  #   context 'ログイン成功のテスト' do
  #     before do
  #       fill_in 'user[email]', with: user.email
  #       fill_in 'user[password]', with: user.password
  #       click_button 'ログイン'
  #     end

  #     it 'ログイン後のリダイレクト先がトップページになっている' do
  #       expect(current_path).to eq '/'
  #     end
  #   end

  #   context 'ログイン失敗のテスト' do
  #     before do
  #       fill_in 'user[email]', with: ''
  #       fill_in 'user[password]', with: ''
  #       click_button 'ログイン'
  #     end

  #     it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
  #       expect(current_path).to eq '/users/sign_in'
  #     end
  #   end
  # end

  # describe 'ヘッダーのテスト：ログインしている場合' do
  #   before do
  #     visit new_user_session_path
  #     fill_in 'user[email]', with: user.email
  #     fill_in 'user[password]', with: user.password
  #     click_button 'ログイン'
  #   end

  #   context '表示内容の確認' do
  #     it 'タイトルロゴが表示される' do
  #       expect(page).to have_content 'logo.jpeg'
  #     end
  #     it 'タイトルロゴがトップページへのリンクになっている' do
  #       expect(page).to have_link 'logo.jpeg', href: root_path
  #     end
  #     it 'ログアウトリンクが表示される' do
  #       expect(page).to have_link 'ログアウト', href: destroy_user_session_path
  #     end
  #     it 'マイページリンクが表示される' do
  #       expect(page).to have_link 'マイページ', href: user_path(user)
  #     end
  #     it '検索フォームが表示される' do
  #       expect(page).to have_form 'search[value]'
  #     end
  #     it 'モデルのセレクトボックスが表示される' do
  #       expect(page).to have_select('search[model]', options: ['ユーザー', '投稿'])
  #     end
  #     it '検索方法のセレクトボックスが表示される' do
  #       expect(page).to have_select('search[how]', options: ['完全一致', '前方一致', '後方一致', '部分一致'])
  #     end
  #     it '検索ボタンが表示される' do
  #       expect(page).to have_button '検索'
  #     end
  #   end
  # end

  # describe 'ログアウトのテスト' do
  #   before do
  #     visit new_user_session_path
  #     fill_in 'user[email]', with: user.email
  #     fill_in 'user[password]', with: user.password
  #     click_button 'ログイン'
  #     click_link 'ログアウト'
  #   end

  #   context 'ログアウト機能のテスト' do
  #     it 'ログアウト後のリダイレクト先がトップページになっている' do
  #       expect(current_path).to eq '/'
  #     end
  #   end
  # end

  # describe '投稿詳細ページのテスト：ログインしていない状態' do
  #   before do
  #     visit post_path(post)
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/posts/' + post.id.to_s
  #     end
  #     it 'ユーザー名のリンク先が正しい' do
  #       expect(page).to have_link post.user.name, href: user_path(post.user)
  #     end
  #     it '投稿年月日、時刻が表示される' do
  #       expect(page).to have_content post.created_at
  #     end
  #     it 'いいね数が表示される' do
  #       expect(page).to have_content post.favorites.count
  #     end
  #     it '投稿のタイトルが表示される' do
  #       expect(page).to have_content post.title
  #     end
  #     it '投稿の本文が表示される' do
  #       expect(page).to have_content post.body
  #     end
  #     it 'タグのリンク先が正しい' do
  #       expect(page).to have_link post.tag, href: tag_posts_path(tag_id: tag.id)
  #     end
  #     it 'コメント数が表示される' do
  #       expect(page).to have_content post.post_comments.count
  #     end
  #   end
  # end

  # describe 'タグ検索結果ページのテスト' do
  #   before do
  #     visit tag_posts_path(tag_id: tag.id)
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/tags/' + post.tag.id.to_s + '/posts'
  #     end
  #     it '投稿したユーザーのプロフィール画像のリンク先が正しい' do
  #       expect(page).to have_link '', href: user_path(post.user)
  #     end
  #     it '投稿のタイトルのリンク先が正しい' do
  #       expect(page).to have_link post.title, href: post_path(post)
  #     end
  #     it '投稿の本文が表示される' do
  #       expect(page).to have_content post.body
  #     end
  #   end
  # end

  # describe 'フッターのテスト' do
  #   context '表示内容の確認' do
  #     it 'お問い合わせ先リンクが表示され、リンクの内容が正しい' do
  #       expect(page).to have_link 'お問い合わせ', href: new_contact_path
  #     end
  #   end
  # end

end
