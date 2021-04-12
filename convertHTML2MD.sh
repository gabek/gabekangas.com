for file in *.html; do 
    if [ -f "$file" ]; then
        sed -n '/---/,/---/p' "$file" > "$file.md"
        sed '/---/,/---/d' "$file" | pandoc --from html --to markdown -f html-native_divs-native_spans+raw_html | fmt --width=800 >> "$file.md"
    fi 
done