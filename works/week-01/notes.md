### W1D1

- `chmod +x <filepath>`: 給檔案可執行的權限
- `git mv <old/file/path> <new/file/path>`: 在 git 記錄內更改檔名

### W1D2

- `$1`: 第一個參數，`$2`、`$3` 以此類推，是第二、第三個參數
- `$#`: 列出帶入的參數量
- `$@`: 以空格分開後，帶入的所有參數，需要注意，搭配 for loop 時要包成 `"$@"`
  - `$@` 與 `"$@"` 的差別：沒引號時，bash 會對展開結果再做 word splitting（依空白切開）和 glob 展開（* 變成檔名清單）。`"$@"` 是特例，它會展開成「每個參數各自被引號包住」，所以參數邊界會保留下來。 

```bash
# for per in $@
> works/week-01/greet.sh "Linux Windows Mac" '*'
  Greetings, Linux
  Greetings, Windows
  Greetings, Mac
  Greetings, 2_Learning_Schedule_Starter_Kit_by_TWN.pdf
  Greetings, custom-roadmap.md
  Greetings, works

# for per in "$@"
> works/week-01/greet.sh "Linux Windows Mac" '*'
  Greetings, Linux Windows Mac
  Greetings, *
```

- `-eq` vs `==`: `==` 是比較字串，在數學比對上建議使用 `-eq`