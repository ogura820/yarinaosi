require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
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
        task = Task.new(substance: '成功テスト', content: '成功する??')
        expect(task).to be_valid
        #substance,contentどちらかが空白だと失敗するのでテストコードは正しい
      end
    end
  end
end