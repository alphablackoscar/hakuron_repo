#!/bin/bash

# 出力ファイル名を設定
output_file="dissertation_complete.md"

# 既存の出力ファイルがあれば削除
if [ -f "$output_file" ]; then
    rm "$output_file"
fi

# 各章を順番に結合
echo "# 日本語ポピュラー音楽における作詞創作過程の研究" > "$output_file"
echo "" >> "$output_file"

# 第4章を追加
cat "博論草稿4.md" >> "$output_file"
echo "" >> "$output_file"

# 第5章を追加
cat "博論草稿5.md" >> "$output_file"
echo "" >> "$output_file"

# 第6章を追加
cat "博論草稿6以降.md" >> "$output_file"

echo "論文の結合が完了しました。出力ファイル: $output_file" 