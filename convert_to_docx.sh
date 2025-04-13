#!/bin/bash

# pandocのパスを設定
PANDOC="/opt/homebrew/bin/pandoc"

# 引数の数をチェック
if [ $# -ne 1 ]; then
    echo "エラー: 日付を指定してください（例: ./convert_to_docx.sh 0414）"
    exit 1
fi

# 引数が4桁の数字かチェック
if ! [[ $1 =~ ^[0-9]{4}$ ]]; then
    echo "エラー: 日付は4桁の数字で指定してください（例: 0414）"
    exit 1
fi

# 月と日を抽出
month=${1:0:2}
day=${1:2:2}

# 月が1-12の範囲内かチェック
if [ $month -lt 1 ] || [ $month -gt 12 ]; then
    echo "エラー: 月は01-12の範囲で指定してください"
    exit 1
fi

# 日が1-31の範囲内かチェック
if [ $day -lt 1 ] || [ $day -gt 31 ]; then
    echo "エラー: 日は01-31の範囲で指定してください"
    exit 1
fi

# pandocの存在チェック
if [ ! -x "$PANDOC" ]; then
    echo "エラー: pandocが見つかりません（$PANDOC）"
    exit 1
fi

# 引数から日付部分を取得（mmdd形式）
date_suffix="$1"

# 入力ファイルと出力ファイルのパスを設定
input_file="/Users/sugiharayousuke/作詞研究/博論git/hakuron_repo/博論草稿${date_suffix}.md"
output_file="/Users/sugiharayousuke/作詞研究/博論git/hakuron_repo/博論草稿${date_suffix}.docx"

# 入力ファイルの存在チェック
if [ ! -f "$input_file" ]; then
    echo "エラー: 入力ファイル（博論草稿${date_suffix}.md）が見つかりません"
    exit 1
fi

# 文字数をカウント
char_count=$(wc -m < "$input_file")
echo "入力ファイルの文字数: $char_count 文字"

# Pandocを使用してmdファイルをdocxに変換
if "$PANDOC" "$input_file" -o "$output_file"; then
    echo "変換が完了しました。出力ファイル: 博論草稿${date_suffix}.docx"
else
    echo "エラー: 変換に失敗しました"
    exit 1
fi 