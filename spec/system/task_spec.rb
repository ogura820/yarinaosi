require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    # let!(:user) { FactoryBot.create(:user) }
    # let!(:task) { FactoryBot.create(:task, substance: 'task', user: user) }
    # before do
    #   # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
    #   visit new_session_path
    #   sleep 0.5
    #   fill_in 'session[email]', with: 'test@gmail.com'
    #   fill_in 'session[password]', with: 'password'
    #   sleep 0.5
    #   click_button 'Log in'
    #   sleep 0.5
    #   visit tasks_path
    #   sleep 0.5
    # end
    # context '一覧画面に遷移した場合' do
    #   it '作成済みのタスク一覧が表示される' do
    #     # テストで使用するためのタスクを作成
    #     # task = FactoryBot.create(:task, substance: 'task')
    #     # taskだけの記述もいらない(let!は即時実行されるため)
    #     # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
    #     # visit tasks_path
    #     # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
    #     expect(page).to have_content'task'
    #     # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
    #   end
    # end
    # context 'タスクが作成日時の降順に並んでいる場合' do
    #   it '新しいタスクが一番上に表示される' do
    #     #5.times do
    #     #  task
    #     #end  だと上書きされて１つしかできない
    #     3.times do |n|
    #       FactoryBot.create(:task, substance: "task #{n+1}", user: user)
    #     end
    #     visit tasks_path
    #     task_list = all('.task_row') 
    #     expect(task_list).not_to be_empty 
    #     task_first = task_list[0]
    #     expect(task_first.text).to include("task 3")
    #   end
    # end
    # context '終了期限でソートするというリンクを押した場合' do
    #   it '終了期限の降順に並び替えられたタスク一覧が表示される' do
    #     3.times do |n|
    #       FactoryBot.create(:task, period: DateTime.new(2022, 8, 10 - n , 10, 30), user: user)
    #     end
    #     visit tasks_path
    #     click_link '終了期限でソートする'
    #     sleep 1
    #     #処理が早すぎて要素を取得できない？？？
    #     task_list = all('.task_period') 
    #     expect(task_list).not_to be_empty 
    #     task_first = task_list[0]
    #     expect(task_first.text).to include("2021")
    #     # 一番終了期限が早いのはFactoryBotの初期値の2021のデータ
    #   end
    # end
    # context '優先順位でソートするというリンクを押した場合' do
    #   it '優先順位の高い順に並び替えられたタスク一覧が表示される' do
    #     FactoryBot.create(:task, priority: "低", user: user)
    #     FactoryBot.create(:task, priority: "中", user: user)
    #     FactoryBot.create(:task, priority: "高", user: user)
    #     visit tasks_path
    #     click_link '優先順位でソートする'
    #     task_list = all('.task_priority') 
    #     expect(task_list).not_to be_empty 
    #     task_first = task_list[0]
    #     expect(task_first.text).to include("高")
    #   end
    # end
  end

  # describe '新規作成機能' do
  #     let!(:user) { FactoryBot.create(:user) }
  #     before do
  #       # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
  #       visit new_session_path
  #       sleep 1
  #       fill_in 'session[email]', with: 'test@gmail.com'
  #       fill_in 'session[password]', with: 'password'
  #       sleep 1
  #       click_button 'Log in'
  #       sleep 1
  #       visit tasks_path
  #       sleep 1
  #     end
  #   context 'タスクを新規作成した場合' do
  #     it '作成したタスクが表示される' do
  #     # 1. new_task_pathに遷移する（新規作成ページに遷移する）
  #     visit new_task_path
  #     # 2. 新規登録内容を入力する
  #     #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
  #     fill_in 'task[substance]', with: 'タスク名です'
  #     fill_in 'task[content]', with: '詳細内容です'
  #     fill_in 'task[period]', with: DateTime.new(2021, 8, 1, 10, 30)
  #     desired_option = '着手中'
  #     select desired_option, from: 'task_state_for_progress'
  #     # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
  #     click_button('登録する')
  #     sleep 1
  #     # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
  #     expect(page).to have_content'タスク名です'
  #     expect(page).to have_content'詳細内容です'
  #     # expect(page).to have_content'これがコメントアウトされていないと失敗'
  #     expect(page).to have_content'2021-08-01 10:30'
  #     # https://higmonta.hatenablog.com/entry/2021/07/22/030109
  #     expect(page).to have_content'着手中'
  #     end
  #   end
  # end

  # describe '詳細表示機能' do
  #   let!(:user) { FactoryBot.create(:user) }
  #   before do
  #     # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
  #     visit new_session_path
  #     sleep 1
  #     fill_in 'session[email]', with: 'test@gmail.com'
  #     fill_in 'session[password]', with: 'password'
  #     sleep 1
  #     click_button 'Log in'
  #     sleep 1
  #     visit tasks_path
  #     sleep 1
  #   end
  #   context '任意のタスク詳細画面に遷移した場合' do
  #     it '該当タスクの内容が表示される' do
  #       task = FactoryBot.create(:task, substance: 'タスク名で', user: user)
  #       visit tasks_path
  #       click_link('詳細')
  #       expect(page).to have_content'タスク名で'
  #       expect(page).to have_content'test_content'
  #     end
  #   end
  # end

  #   describe '検索機能' do
  #     let!(:user) { FactoryBot.create(:user) }
  #     before do
  #       visit new_session_path
  #       sleep 1
  #       fill_in 'session[email]', with: 'test@gmail.com'
  #       fill_in 'session[password]', with: 'password'
  #       sleep 1
  #       click_button 'Log in'
  #       sleep 1
  #       visit tasks_path
  #       sleep 1
  #       FactoryBot.create(:task, substance: "taskですよ", state_for_progress: "未着手", user: user)
  #       FactoryBot.create(:task, substance: "sampleなんです", state_for_progress: "完了", user: user)
  #       FactoryBot.create(:task, substance: "taskなんです", state_for_progress: "完了", user: user)
  #     end
  
  #     context 'タイトルであいまい検索をした場合' do
  #       it "検索キーワードを含むタスクで絞り込まれる" do
  #         visit tasks_path
  #         # タスクの検索欄に検索ワードを入力する (例: task)
  #         fill_in 'substance_keyword', with: 'task'
  #         # 検索ボタンを押す
  #         click_button 'Search'
  #         expect(page).to have_content 'task'
  #         expect(page).to have_no_content 'sample'
  #       end
  #     end
  #     context 'ステータス検索をした場合' do
  #       it "ステータスに完全一致するタスクが絞り込まれる" do
  #         visit tasks_path
  #         desired_option = '未着手'
  #         select desired_option, from: 'progress_keyword'
  #         click_button 'Search'
  #         expect(page).to have_content '未着手'
  #         expect(page).to have_no_content 'sampleなんです'
  #         expect(page).to have_no_content 'taskなんです'
  #       end
  #     end
  #     context 'タイトルのあいまい検索とステータス検索をした場合' do
  #       it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
  #         visit tasks_path
  #         desired_option = '完了'
  #         select desired_option, from: 'progress_keyword'
  #         fill_in 'substance_keyword', with: 'task'
  #         click_button 'Search'
  #         expect(page).to have_content 'taskなんです'
  #         expect(page).to have_no_content 'taskですよ'
  #         expect(page).to have_no_content 'sampleなんです'
  #       end
  #     end
  #   end
    
    describe 'ラベル機能' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:label) { FactoryBot.create(:label) }
      let!(:label2) { FactoryBot.create(:label2) }
      before do
        # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
        visit new_session_path
        sleep 1
        fill_in 'session[email]', with: 'test@gmail.com'
        fill_in 'session[password]', with: 'password'
        sleep 1
        click_button 'Log in'
        sleep 1
        visit tasks_path
        sleep 1
      end
    context 'タスクを新規作成時、ラベルを選択した場合' do
      it '選択したラベルが表示される' do
      visit new_task_path
      fill_in 'task[substance]', with: 'タスク名です'
      fill_in 'task[content]', with: '詳細内容です'
      fill_in 'task[period]', with: DateTime.new(2021, 8, 1, 10, 30)
      desired_option = '着手中'
      select desired_option, from: 'task_state_for_progress'
      check 'test_label1'
      click_button('登録する')
      expect(page).to have_content'test_label1'
      end
    end
    context 'タスクを新規作成時、複数ラベルを選択した場合' do
      it '選択したラベルが複数表示される' do
        visit new_task_path
        fill_in 'task[substance]', with: 'タスク名です'
        fill_in 'task[content]', with: '詳細内容です'
        fill_in 'task[period]', with: DateTime.new(2021, 8, 1, 10, 30)
        desired_option = '着手中'
        select desired_option, from: 'task_state_for_progress'
        check 'test_label1'
        check 'test_label2'
        click_button('登録する')
        sleep 1
        expect(page).to have_content'test_label2'
        expect(page).to have_content'test_label1'
      end
    end
    context 'タスクを新規作成時、ラベルを選択した場合' do
      it '選択したラベルが詳細画面に表示される' do
        visit new_task_path
        fill_in 'task[substance]', with: 'タスク名です'
        fill_in 'task[content]', with: '詳細内容です'
        fill_in 'task[period]', with: DateTime.new(2021, 8, 1, 10, 30)
        desired_option = '着手中'
        select desired_option, from: 'task_state_for_progress'
        check 'test_label1'
        check 'test_label2'
        click_button('登録する')
        sleep 1
        click_link('詳細')
        sleep 2
        expect(page).to have_content'test_label2'
        expect(page).to have_content'test_label1'
      end
    end
    context '一覧画面でラベルを選択した場合' do
      it '選択したラベルだけが含まれるタスクだけが一覧に表示される' do
        visit new_task_path
        fill_in 'task[substance]', with: 'このタスクは消えます'
        fill_in 'task[content]', with: '詳細内容です'
        fill_in 'task[period]', with: DateTime.new(2021, 8, 1, 10, 30)
        desired_option = '着手中'
        select desired_option, from: 'task_state_for_progress'
        check 'test_label1'
        click_button('登録する')
        sleep 1
        visit new_task_path
        fill_in 'task[substance]', with: 'タスク名です'
        fill_in 'task[content]', with: '詳細内容です'
        fill_in 'task[period]', with: DateTime.new(2021, 8, 1, 10, 30)
        desired_option = '着手中'
        select desired_option, from: 'task_state_for_progress'
        check 'test_label2'
        click_button('登録する')
        desired_option = 'test_label2'
        select desired_option, from: 'label_id'
        click_button 'Search'
        sleep 2
        expect(page).to have_content'test_label2'
        expect(page).not_to have_content'このタスクは消えます'
      end
    end
  end

end