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
