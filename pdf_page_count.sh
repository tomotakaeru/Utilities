#!/bin/bash
# find ./ -name "[、-鶴]*.pdf" -type f -printf "%f\t\t" -exec sh -c "pdfinfo {} |grep '^Pages: ' | awk '{gsub(/^Pages:\s*/, '\s'); print $1}'" \;

i=0
sum=0
page=()
for path in `find ./ -name "[!0-9a-zA-Z]*.pdf" -type f`; do #頭文字が英数でない.pdfを抽出
    page[$i]=`pdfinfo $path |grep '^Pages: ' | awk '{gsub(/^Pages:\s*/, '\s'); print $1}'`
    file_nopath="${path##*/}"    #パスを除去
    file="${file_nopath%.*}"    #拡張子を除去
    echo -e "$file\t\t${page[$i]}枚"
    sum=`expr $sum + ${page[$i]}`
    let i++
done
echo -e "レポート数：$i\t合計枚数：$sum"
