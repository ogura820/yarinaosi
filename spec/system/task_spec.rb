require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    let!(:task) { FactoryBot.create(:task, substance: 'task') }
    before do
      # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
      visit tasks_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを作成
        # task = FactoryBot.create(:task, substance: 'task')
        # taskだけの記述もいらない(let!は即時実行されるため)
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # visit tasks_path
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content'task'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        #5.times do
        #  task
        #end  だと上書きされて１つしかできない
        3.times do |n|
          FactoryBot.create(:task, substance: "task #{n+1}")
        end
        visit tasks_path
        task_list = all('.task_row') 
        expect(task_list).not_to be_empty 
        task_first = task_list[0]
        expect(task_first.text).to include("task 3")
      end
    end
    context '終了期限でソートするというリンクを押した場合' do
      it '終了期限の降順に並び替えられたタスク一覧が表示される' do
        3.times do |n|
          FactoryBot.create(:task, period: DateTime.new(2022, 8, 10 - n , 10, 30))
        end
        visit tasks_path
        click_link '終了期限でソートする'
        task_list = all('.task_period') 
        expect(task_list).not_to be_empty 
        task_first = task_list[0]
        puts task_first.text
        expect(task_first.text).to include("2021")
        # 一番終了期限が早いのはFactoryBotの初期値の2021のデータ
      end
    end
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
      # 1. new_task_pathに遷移する（新規作成ページに遷移する）
      visit new_task_path
      # 2. 新規登録内容を入力する
      #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      fill_in 'task[substance]', with: 'タスク名です'
      fill_in 'task[content]', with: '詳細内容です'
      fill_in 'task[period]', with: DateTime.new(2021, 8, 1, 10, 30)
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      click_button('登録する')
      # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
      expect(page).to have_content'タスク名です'
      expect(page).to have_content'詳細内容です'
      # expect(page).to have_content'これがコメントアウトされていないと失敗'
      expect(page).to have_content'2021-08-01 10:30'
      # https://higmonta.hatenablog.com/entry/2021/07/22/030109
      end
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