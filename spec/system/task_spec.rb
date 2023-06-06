require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
      # 1. new_task_pathに遷移する（新規作成ページに遷移する）
      visit new_task_path
      # 2. 新規登録内容を入力する
      #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      fill_in 'task[substance]', with: 'タスク名です'
      fill_in 'task[content]', with: '詳細内容です'
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      click_button('Create Task')
      # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
      expect(page).to have_content'タスク名です'
      expect(page).to have_content'詳細内容です'
      # expect(page).to have_content'これがコメントアウトされていないと失敗'
      end
    end
  end

  context '一覧画面に遷移した場合' do
    it '作成済みのタスク一覧が表示される' do
      # テストで使用するためのタスクを作成
      task = FactoryBot.create(:task, substance: 'task')
      # taskだけの記述もいらない(let!は即時実行されるため)
      # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
      visit tasks_path
      # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
      expect(page).to have_content'task'
      # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task, substance: 'タスク名で')
        visit tasks_path
        click_link('詳細')
        expect(page).to have_content'タスク名で'
        expect(page).to have_content'test_content'
      end
    end
  end
end