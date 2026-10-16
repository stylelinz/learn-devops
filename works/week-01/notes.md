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

### W1D3

- `if`: 需要注意 `[` 跟 `]` 裡面都要有空格，不然會出錯
  ```bash
  if [ <conditions> ]; then
    echo "greet.sh 失敗"
  else
    echo "greet.sh 成功"
  fi
  ```

- `&&`、`||`: 
  ```bash
  ./pass.sh && echo "這個會顯示出來"
  ./pass.sh || echo "這個不會顯示"
  ./failed.sh || echo "這個會顯示出來"
  ```

> 小實驗
> ```bash
> true && false || echo "這個會顯示出來嗎"
> ```
> **ans**: 會，bash 是以左而右執行，所以先執行 (`true && false`) -> `false`，效果等同 false || echo "..."

### W1D4

`check-files.sh` 會從呼叫的地方 (pwd)，列出該地的所有檔案/資料夾
- `*`: 在 bash 裡面代表的是 glob，會遍歷目前目錄底下的所有項目（有點像 `ls`），但是不會列出 `.env`、`.git` 之類的隱藏檔案/資料夾
- 一元運算子: 在 bash 裡面，一元運算子只需要在右邊放變數、字串等資料，本次使用的 `-d`、`-f` 都是一元運算子，

### W1D5

- `date`: 呼叫時間
- `if ! [ <condition>] ...`: if not 語法
- 呼叫工具後儲存 stdout 作為變數: `var=$(...<call tools>)`