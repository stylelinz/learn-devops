### W2D1

- `PORT=9000 ./deploy.sh`: `deploy.sh` 會吃前面宣告的 `PORT` 放進新的 process，正確列印出 `9000`，但是外面的 shell process 就不會吃到這個變數
- `export PORT=9000` 後，再呼叫 `./deploy.sh`: 已經靠 `export` 宣告成環境變數了，所以 `./deploy.sh` 讀取得到，可以正確列印
- `PORT=9000` 後，再呼叫 `./deploy.sh`: 因為只有在 shell process 宣告變數，所以新 process `./deploy.sh` 不會吃到這個變數，會印出空值