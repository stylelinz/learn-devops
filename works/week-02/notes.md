### W2D1

- `PORT=9000 ./deploy.sh`: `deploy.sh` 會吃前面宣告的 `PORT` 放進新的 process，正確列印出 `9000`，但是外面的 shell process 就不會吃到這個變數
- `export PORT=9000` 後，再呼叫 `./deploy.sh`: 已經靠 `export` 宣告成環境變數了，所以 `./deploy.sh` 讀取得到，可以正確列印
- `PORT=9000` 後，再呼叫 `./deploy.sh`: 因為只有在 shell process 宣告變數，所以新 process `./deploy.sh` 不會吃到這個變數，會印出空值

### W2D2

- `BASH_SOURCE[0]` v.s. `$0`: 以直接執行來說沒差，但若透過 source 載入就有差別
  - `BASH_SOURCE[0]`: 指的是腳本路徑
  - `$0`: 指的是當前的 shell 名稱，例如: `/bin/bash` 或 `bash`
- `2>&1`: 接收所有正確或錯誤的訊息
- 指令最後面的 `&`: 讓指令在背景執行

### W2D3

- macOS 預設沒有 `ss` 工具，但是有 `lsof`，同樣可以列出佔用 port 的 pid
- `kill` 只是送出 SIGTERM 給 process，需要留意 process 是否有成功終止，導致 port 依舊被佔用
- bash 若要做變數加減，則需要使用 `((var - 1))` 這種雙括弧來包住
  - `var=$((var - 1))`：`$(( ))` 會算出一個值，再賦值給變數
  - `((var--))`：`(( ))` 直接修改變數
  - 踩到的坑：`var=$((var--))` 不會減少，因為後置遞減回傳的是舊值，又被寫回去了。

用 port 找 v.s. pidfile

port

- 直接從系統尋找，開銷較大，但是是 single source of truth

pidfile

- local state，開銷較小，但是可能會導致目前 pid 與 pidfile 無法對齊

### W2D4

- curl 在完全找不到 server 的情況下，http_code 會是 0
- curl `-w` 可以自訂輸出內容

### W2D5

- 在 script 使用 pipe 時，若中間出現錯誤，最後依舊會 return 0，後續被其他腳本呼叫會出現誤判的風險
  - 解法是在 script 開頭加上 `set -euo pipefail`，這樣 pipe 中間失敗了也會 return 1
