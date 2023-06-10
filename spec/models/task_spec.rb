require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    let!(:user) { FactoryBot.create(:user) }
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(substance: '', content: '失敗テスト')
        #substanceの''に文字を入れると失敗するのでテストコードは正しい
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(substance: '失敗テスト', content: '')
        expect(task).not_to be_valid
        #contentの''に文字を入れると失敗するのでテストコードは正しい
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(substance: '成功テスト', content: '成功する??',user: user)
        expect(task).to be_valid
        #substance,contentどちらかが空白だと失敗するのでテストコードは正しい
      end
    end
  end

  describe '検索機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:task) { FactoryBot.create(:task, substance: 'task', user: user) }
    let!(:second_task) { FactoryBot.create(:task, substance: "sample", user: user) }
    let!(:third_task) { FactoryBot.create(:task, substance: "sample", state_for_progress: "完了", user: user)}
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.search_by_substance('task')).to include(task)
        expect(Task.search_by_substance('task')).not_to include(second_task)
        expect(Task.search_by_substance('task').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.search_by_state_for_progress('未着手')).to include(task)
        expect(Task.search_by_state_for_progress('未着手')).to include(second_task)
        expect(Task.search_by_state_for_progress('完了')).to include(third_task)
        expect(Task.search_by_state_for_progress('完了').count).to eq 1
        expect(Task.search_by_state_for_progress('未着手').count).to eq 2
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.search_by_substance('sample')
                    .search_by_state_for_progress('完了')).to include(third_task)
        expect(Task.search_by_substance('sample')
                    .search_by_state_for_progress('完了').count).to eq 1
        expect(Task.search_by_substance('sample')
                    .search_by_state_for_progress('完了').count).not_to eq 2
      end
    end
  end
end