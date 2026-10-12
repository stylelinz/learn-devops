# Custom DevOps Roadmap

> 依據 TechWorld with Nana 的 26 週 Learning Schedule 的 4 個 Level 架構，按 2026-10-10 的程度測驗結果與個人節奏重新編排。
> 節奏：**週一到週五，每天 30 分鐘，每天結束時都有一個可驗證的產出。**

---

## 1. 程度測驗結果（2026-10-10）

共 19 題情境題 + 1 題實作經驗調查。每個主題只有 1–2 題，所以這是粗略訊號，不是精確評分；各階段結尾的 checkpoint 會再校正一次。

| Level | 主題 | 題目 | 結果 | 判定 |
|---|---|---|---|---|
| 1 | Linux 檔案權限 | `chmod 750` 群組權限 | ✅ | 已掌握 |
| 1 | Shell scripting | `$?` 的意義 | ❓ 不確定 | **待補** |
| 1 | 網路：NAT | private VM 如何出網 | ❌ 選了 inbound 防火牆 | **待補** |
| 1 | 網路：Subnet | 不同 /24 能否直接互通 | ❓ 不確定 | **待補** |
| 1 | Git | 撤銷已 push 的 commit | ✅ | 已掌握 |
| 1 | Build Tools | Maven 依賴與 artifact | ✅ | 已掌握 |
| 2 | 雲端部署排錯 | port 8080 timeout | ✅ | 已掌握 |
| 2 | Nexus | hosted vs proxy | ✅ | 已掌握（概念） |
| 2 | Docker 網路 | container 間以名稱連線 | ✅ | 已掌握（有實作） |
| 2 | Dockerfile | layer cache | ✅ | 已掌握（有實作） |
| 3 | Jenkins | container 內跑 docker | ❓ 不確定 | **未學**（但用過其他 CI/CD） |
| 3 | AWS / CIDR | 在 /16 裡切 /24 | ❓ 不確定 | **未學**（根因是網路基礎） |
| 3 | Kubernetes | Service selector 不符 | ✅ | 有概念 |
| 3 | Kubernetes | readiness vs liveness probe | ❓ 不確定 | **待學**（無實作經驗） |
| 3 | EKS / Fargate | Fargate 是什麼 | ✅ | 有概念 |
| 4 | Terraform | remote state 與 locking | ❓ 不確定 | **未學** |
| 4 | Python | `dict.get` 與 `set` | ❓ 不確定 | **未學** |
| 4 | Ansible | agentless / SSH | ❓ 不確定 | **未學** |
| 4 | Prometheus | exporter 與 scrape | ✅ | 有概念 |

**實作經驗：** Docker / Docker Compose ✅、雲端平台 ✅、CI/CD 工具 ✅、Kubernetes ❌

### 結論

- **Level 1**：大致通過，但有兩個洞：**shell scripting** 與 **網路基礎（IP / subnet / CIDR / NAT）**。網路答錯或不確定了 3 題，而且它是 AWS VPC、Kubernetes Service、Terraform 網路設定的共同前提，所以排在最前面。
- **Level 2**：通過。只安排一週鞏固沒測到的部分（volumes、best practices），並建立之後全程使用的練習應用。
- **Level 3**：真正的起點。Jenkins 和 AWS 從頭學；Kubernetes 有概念但沒動過手，照完整份量學。
- **Level 4**：Terraform、Python、Ansible 從頭學；Prometheus 有概念，直接從實作開始。

---

## 2. 調整原則

1. **時數差距要先講清楚。** 原 roadmap 是 26 週 × 15 小時 ≈ 390 小時；你的節奏是每週 2.5 小時。這份 roadmap 排了 **53 週 ≈ 132 小時**，約為原份量的三分之一。差額來自三處：跳過已掌握的內容、刪掉重複的 demo（同一件事在 DigitalOcean / Linode / AWS 各做一次的只做一次）、每個主題只留最核心的實作。
2. **每天一個產出。** 每個項目都寫成「做完會留下什麼」：一個檔案、一個跑得起來的東西、或一段自己寫的說明。當天沒做完就隔天接著做，不要跳過。
3. **維持原本的 Level 順序。** 只把 Level 1 的補洞放在最前面。
4. **⏱ 標記代表 30 分鐘做不完。** EKS 建立一次就要 15–20 分鐘，而且放著會持續計費，必須「當次建、當次刪」。這些項目把兩天合併成一次 60–75 分鐘的時段，該週另一天休息。
5. **費用。** AWS 階段開始前先設 budget alert；每個有雲端資源的週次最後一步都是刪除資源。
6. **一個貫穿全程的練習應用 `demo-app`。** Week 5 建立：一個小型 web 應用，有 `/health`（不依賴資料庫）、一個讀寫資料庫的 endpoint、至少一個自動化測試，放在獨立的 Git repo。語言用你最熟的，資料庫下文以 MongoDB 為例。之後的 pipeline、Kubernetes、Terraform、Ansible、Prometheus 都以它為部署對象，每個階段都是在同一個東西上往前加一層。
7. **產出都進 Git。** 這個資料夾在 Week 1 第一天 `git init`，每天的產出放進 `works/week-NN/` 並 commit；文字類的產出寫在 `works/week-NN/notes.md`。「當天完成」的定義是：項目裡寫的驗證通過，而且有 commit。
8. **Checkpoint 測能力，不測記憶。** 每個階段的 checkpoint 都是不看自己的筆記（可查官方文件）、限時、從空資料夾開始的實作，並寫明通過條件。沒通過就先補，再往下走。

### 刻意略過的內容

| 原 roadmap 內容 | 原因 |
|---|---|
| Git 基礎指令、分支、merge conflict（Week 2–3） | 測驗通過 |
| Maven / Gradle / npm 基礎（Week 3） | 測驗通過 |
| 資料庫類型概覽、Windows vs Linux CLI（Week 3） | 概念性內容，用到再查 |
| VirtualBox 安裝 Ubuntu VM（Week 1） | 你已在 WSL2 上，且有雲端 VM 經驗 |
| Linux 使用者、群組與擁有權（Week 1） | 權限題測驗通過；Week 46、47 用 Ansible 建使用者時會再碰到 |
| Nexus 安裝、blob store、cleanup policy（Week 4–5、7） | 概念已通過；實務上多半用雲端 registry |
| Docker 基礎指令（Week 5） | 已有實作經驗 |
| GitLab plugin 整合（Week 9） | 以通用的 webhook / poll SCM 概念取代 |
| 用 console 手動逐步建 EKS、Fargate 實作（Week 15） | 只保留概念比較，動手部分用 eksctl |
| Linode LKE 部署（Week 13–14、16） | 與 minikube / EKS 重複 |
| mongo-express、mosquitto 等示範應用（Week 12–13） | 改用 `demo-app`，避免每週換一個應用 |

---

## 3. 總覽

| 階段 | Level | 主題 | 自訂週次 | 對應原週次 | 處理方式 |
|---|---|---|---|---|---|
| A | 1 Prerequisites | Shell scripting、網路基礎 | 1–4 | 1–2 | 只補洞 |
| B | 2 Fundamentals | Docker 鞏固、建立 `demo-app` | 5 | 5–7 | 壓縮成一週 |
| C | 3 Core Part 1 | CI/CD with Jenkins | 6–11 | 8–10 | 從頭學 |
| D | 3 Core Part 1 | AWS | 12–16 | 10–11 | 從頭學 |
| E | 3 Core Part 2 | Kubernetes | 17–26 | 12–14 | 完整份量 |
| F | 3 Core Part 3 | Kubernetes on AWS (EKS) | 27–30 | 15–16 | 精簡實作 |
| G | 4 Advanced Part 1 | Terraform | 31–38 | 17–20 | 從頭學 |
| H | 4 Advanced Part 2 | Python 與自動化 | 39–44 | 21–22 | 從頭學 |
| I | 4 Advanced Part 3 | Ansible | 45–49 | 23–25 | 從頭學 |
| J | 4 Advanced Part 4 | Prometheus 監控 | 50–53 | 25–26 | 從實作開始 |

若從 2026-10-12（週一）開始且不中斷，預計 2027-10-15 完成。

---

## Level 1 — DevOps Prerequisites（補洞）

### Week 1 — Shell Scripting 基礎

**Focus：** 能寫出會判斷成功與失敗的 bash 腳本

**Key Topics：** shebang、變數、位置參數、exit code、條件、迴圈、函式

- [x] **一**　在這個資料夾 `git init` 並建立 `works/week-01/`；寫 `hello.sh`：含 shebang、一個變數，`chmod +x` 後執行成功，commit
- [ ] **二**　寫 `greet.sh`：用 `$1`、`$#`、`$@`，沒給參數時印出 usage 並 `exit 1`；用 `echo $?` 確認兩種情況的 exit code
- [ ] **三**　寫 `exitcode.sh`：依序執行一個會失敗與一個會成功的指令，各自印出 `$?`，再用 `if`、`&&`、`||` 依 exit code 分支
- [ ] **四**　寫 `check-files.sh`：用 `for` 走訪一個目錄，以 `[ -f ]`、`[ -d ]` 標示每個項目是檔案還是目錄
- [ ] **五**　寫 `backup.sh`：用函式把指定目錄打包成帶日期的 `tar.gz`，開頭加 `set -euo pipefail`，目錄不存在時回傳非 0；兩種情況各跑一次確認

### Week 2 — 一支部署腳本：環境變數、重導向、行程

**Focus：** 五天逐步寫出一支 `deploy.sh`，補齊部署腳本會用到的 Linux 操作

**Key Topics：** 環境變數、管線與重導向、行程與 port、健康檢查

> 這週的部署對象先用 `python3 -m http.server` 代替，Week 5 之後換成 `demo-app`。

- [ ] **一**　寫 `deploy.sh` 第一版：讀取 `APP_ENV`（未設定時用 `${APP_ENV:-dev}`）與 `PORT` 並印出；分別用 `PORT=9000 ./deploy.sh`、`export PORT=9000`、只寫 `PORT=9000` 不 export 三種方式執行，寫下哪一種讀不到、為什麼
- [ ] **二**　加上啟動：在背景執行 `python3 -m http.server "$PORT"`，用 `>` 與 `2>&1` 把輸出導到 log 檔，pid 寫進檔案；`curl localhost:$PORT` 回 200 且 log 檔出現該筆請求
- [ ] **三**　加上「先停舊的」：用 `ss -tlnp` 找出佔用該 port 的行程並 `kill`，再啟動新的；`deploy.sh` 連跑兩次都成功，且 `ps` 只看到一個服務行程
- [ ] **四**　寫 `healthcheck.sh`：`curl` 一個 URL，非 200 就寫一行 log 並 `exit 1`；`deploy.sh` 最後呼叫它，健康檢查失敗時整支腳本回傳非 0
- [ ] **五**　寫 `log-report.sh`：用 `grep`、`wc` 與管線算出 log 檔中各 HTTP status 的行數；請求幾個不存在的路徑後，確認 404 的數字正確

### Week 3 — 網路基礎（一）：IP、Subnet、CIDR

**Focus：** 看到一個 CIDR 能說出範圍，並判斷兩個 IP 是否在同一網段

**Key Topics：** IP 位址、netmask、CIDR、gateway、private 與 public IP、NAT

- [ ] **一**　用 `ip addr` 找出自己機器的 IP 與 prefix 長度，手寫出該網段的第一個與最後一個位址
- [ ] **二**　紙筆算出 /16、/24、/26、/28 各有幾個位址，再用 subnet calculator 核對
- [ ] **三**　用 `ip route` 找出 default gateway；寫下測驗題的答案與理由：192.168.1.10/24 和 192.168.2.10/24 沒有 router 時為何不通
- [ ] **四**　NAT 實作（測驗答錯的那題）：比較本機 `ip addr` 與 `curl ifconfig.me`；再 `docker run --rm -it alpine sh`，在 container 內比較 `ip addr` 與 `wget -qO- ifconfig.me`。用三句話寫出「只有 private IP 的機器為什麼出得去、外面進不來」，以及 `docker run -p 8080:80` 做的是哪個方向的位址轉換
- [ ] **五**　把 10.0.0.0/16 切成 4 個 /24（2 個 public、2 個 private）寫成表格，Week 13 建 VPC 時直接使用

### Week 4 — 網路基礎（二）：Port、Firewall、DNS

**Focus：** 建立一套「連不上」的排錯順序，並寫成腳本

**Key Topics：** port 與 listen 位址、防火牆、DNS 解析

- [ ] **一**　`python3 -m http.server 8000` 後用 `ss -tlnp` 與 `curl` 驗證；改成只綁 127.0.0.1，說明與 0.0.0.0 的差別
- [ ] **二**　用 `sudo iptables -A INPUT -p tcp --dport 8000 -j DROP` 擋住昨天的服務，比較三種狀態下 `nc -zv -w 3 localhost 8000` 的結果：正常、被防火牆擋（timeout）、服務沒在跑（connection refused）；結束後用 `iptables -D` 移除規則
- [ ] **三**　用 `dig` 查一個網域的 A 與 CNAME 紀錄；改 `/etc/hosts` 讓自訂名稱指到本機，`curl` 該名稱成功
- [ ] **四**　寫下自己的排錯順序：DNS → 路由 → port → 服務是否在跑 → 防火牆，每一步附上指令；開始寫 `netcheck.sh <host> <port>`，完成 DNS 與 port 兩步，失敗時分別 `exit 1`、`exit 2`
- [ ] **五**　**Checkpoint（30 分鐘、不看筆記）：** 替 `netcheck.sh` 補上 HTTP 檢查（非 200 則 `exit 3`）。通過條件：三個故意弄壞的情境——不存在的網域、被 iptables 擋住的 port、回 404 的 URL——各回傳正確的 exit code。另外回答一題沒看過的：172.16.5.130/26 的網段範圍是什麼？它和 172.16.5.200 在同一個網段嗎？

---

## Level 2 — DevOps Fundamentals（鞏固）

### Week 5 — Docker 鞏固與 `demo-app`

**Focus：** 補上測驗沒涵蓋的 volumes 與 best practices，並準備好之後 48 週都要用的練習應用

**Key Topics：** named volume 與 bind mount、Compose、Dockerfile 最佳實務、私有 registry

- [ ] **一**　建立 `demo-app` repo（可從現成的範例專案改）：`/health` 不依賴資料庫、一個 endpoint 讀寫資料庫、至少一個測試。本機跑起來後 `curl /health` 回 200、測試指令通過
- [ ] **二**　寫 `demo-app` 的 Dockerfile：固定 base image tag、非 root 使用者、`.dockerignore`、multi-stage build；和單一 stage 的寫法比較 image 大小
- [ ] **三**　寫 compose 檔：app + db + named volume + 自訂 network，一行指令全部啟動；寫入一筆資料後 `docker compose down` 再 `up`，確認資料還在
- [ ] **四**　故意拿掉 app 的資料庫連線設定讓它啟動失敗，只用 `docker logs`、`inspect`、`exec` 找出原因並修好
- [ ] **五**　把 image 以 `registry/repo:tag` 格式推到一個私有 repository（到 Week 29 都用同一個），再從另一個環境 pull 下來執行；把 Week 2 的 `deploy.sh` 改成用 `docker run` 部署它，`healthcheck.sh` 通過

---

## Level 3 — DevOps Core

### Part 1a：CI/CD with Jenkins

### Week 6 — Jenkins 起步

**Focus：** 把 Jenkins 跑起來並完成第一個 job

**Key Topics：** Jenkins in Docker、UI、freestyle job、build tool、Docker 整合

- [ ] **一**　用 Docker 跑 Jenkins（`jenkins_home` 用 named volume），完成初始設定並登入
- [ ] **二**　建第一個 freestyle job，執行 `echo` 與 `whoami`，在 console output 看到結果
- [ ] **三**　讓 freestyle job 連到 `demo-app` 的 Git repo，checkout 後執行 `ls`
- [ ] **四**　在 Jenkins 設定 `demo-app` 需要的 build 工具（Maven 或 Node.js），job 內成功執行它的測試指令
- [ ] **五**　重建 Jenkins container 並掛載 `/var/run/docker.sock`，job 內 `docker ps` 成功（測驗題的實作）；確認重建後前幾天的 job 還在（Week 5 volume 的應用）

### Week 7 — Pipeline 與 Jenkinsfile

**Focus：** 把 pipeline 寫成程式碼

**Key Topics：** freestyle 與 pipeline 的差別、declarative 語法、stage、`when`、`post`、parameters

- [ ] **一**　寫一張對照表：你用過的 CI 工具的概念（job、runner、secret…）各自對應 Jenkins 的什麼
- [ ] **二**　在 `demo-app` repo 寫第一個 declarative Jenkinsfile：build、test、deploy 三個 stage 各印一行，pipeline 全綠
- [ ] **三**　把 build 與 test stage 換成 `demo-app` 真實的指令；故意讓測試失敗一次，確認 pipeline 變紅且沒有進到 deploy
- [ ] **四**　加上 `environment` 區塊、`when`（只有 main 才跑 deploy）與 `post`（失敗時印訊息）；在 console output 各看到一次生效
- [ ] **五**　加上 `parameters`（choice 與 boolean），手動觸發時可選版本與是否跑測試；兩種選擇各跑一次

### Week 8 — Credentials 與 Image Build

**Focus：** pipeline 能安全地 build 並 push image

**Key Topics：** credential 類型、`withCredentials`、docker build 與 push

- [ ] **一**　在 Jenkins 各建一個 secret text、username/password、SSH key 類型的 credential，寫下各自的使用時機
- [ ] **二**　在 Jenkinsfile 用 `withCredentials` 或 `credentials()` 取用，確認 console output 中的值被遮蔽
- [ ] **三**　加入 `docker build`，用 `BUILD_NUMBER` 當 image tag；跑完後 `docker images` 看到 `demo-app:<BUILD_NUMBER>`
- [ ] **四**　加入 `docker login` 與 `docker push` 到 Week 5 的私有 repository；在 registry 上看到新 tag
- [ ] **五**　改一行程式碼，手動觸發後 build → test → push 一次全綠；pull 新 tag 執行，`/health` 回 200

### Week 9 — Multibranch 與 Shared Library

**Focus：** 管理多個分支與重複的 pipeline 邏輯

**Key Topics：** multibranch pipeline、branch 條件、`script.groovy`、shared library

- [ ] **一**　建 multibranch pipeline，掃描出 main 與一條 feature branch 並各自 build
- [ ] **二**　設定分支條件：feature 只 build 與 test，main 才 push image；兩條分支各跑一次，確認 registry 只多出 main 的 tag
- [ ] **三**　把重複步驟抽到 `script.groovy`，用 `load` 引入後 pipeline 仍然全綠
- [ ] **四**　建一個 shared library repo（`vars/buildImage.groovy`），在 Jenkins 全域設定中註冊
- [ ] **五**　Jenkinsfile 以 `@Library` 引入並呼叫 `buildImage`，pipeline 全綠且 registry 出現新 tag

### Week 10 — 自動觸發與版本管理

**Focus：** push 之後自動跑，且每次 build 都有唯一版本

**Key Topics：** webhook 與 poll SCM、版本遞增、pipeline commit 回 Git

- [ ] **一**　讓 push 自動觸發 pipeline（Jenkins 對外可達就設 webhook，否則用 poll SCM）；push 一個 commit，不碰 Jenkins UI 就看到 build 開始
- [ ] **二**　用 build tool 的指令遞增 patch 版本（Maven 的 `versions:set` 或 `npm version patch`），在本機先驗證
- [ ] **三**　在 Jenkinsfile 讀出版本，組成 image tag `<version>-<BUILD_NUMBER>`
- [ ] **四**　讓 pipeline 把版本變更 commit 並 push 回 Git；確認 Git 上多了一個版本 commit，且 pipeline 沒有被它再觸發一次
- [ ] **五**　端到端驗證：push 一行程式碼變更，不手動介入，最後 pull 新版本 tag 執行、`/health` 回 200；畫出整條 pipeline 的流程圖放進 repo

### Week 11 — Jenkins Checkpoint

**Focus：** 不看筆記，在另一個專案上從零重建一條 pipeline

- [ ] **一**　選一個 `demo-app` 以外的小專案（換一個專案才測得出是不是真的會），寫好 Dockerfile 與 Jenkinsfile 骨架
- [ ] **二**　完成 build 與 test stage
- [ ] **三**　完成版本遞增、image build 與 push
- [ ] **四**　加上 credentials、分支條件與 `post` 區塊
- [ ] **五**　**Checkpoint：** 通過條件有兩個——push 一個 commit 後不手動介入，registry 出現新版本的 image 且能執行；故意讓測試失敗時，pipeline 停在 test、沒有 push。另外寫下兩題答案：為什麼要掛 `docker.sock`？為什麼帳密不能寫在 Jenkinsfile？

### Part 1b：AWS

### Week 12 — 帳號、IAM 與 CLI

**Focus：** 安全地設定好 AWS 帳號

**Key Topics：** IAM user、group、policy、role、region、AZ、AWS CLI

- [ ] **一**　root 帳號開啟 MFA，設定一個 5 美元的 budget alert
- [ ] **二**　建立 admin group 與個人 IAM user，之後不再使用 root 登入；寫下 user、group、policy、role 各一句定義
- [ ] **三**　選定一個 region，列出它的 AZ，寫下「subnet 為什麼屬於單一 AZ」
- [ ] **四**　安裝 AWS CLI，`aws configure` 後 `aws sts get-caller-identity` 回傳自己的 IAM user
- [ ] **五**　用 `--query` 與 `--output table` 列出 IAM users 與所有 region

### Week 13 — VPC 與網路

**Focus：** 把 Week 3 的網路知識對應到 AWS

**Key Topics：** VPC、subnet、route table、internet gateway、security group、NACL、NAT gateway

- [ ] **一**　檢視 default VPC：找出它的 CIDR、subnets、route table、internet gateway，畫成一張圖
- [ ] **二**　自建 VPC 10.0.0.0/16 與一個 subnet 10.0.1.0/24（用 Week 3 的表格）；用 `aws ec2 describe-subnets` 確認
- [ ] **三**　加上 internet gateway 與 `0.0.0.0/0` 的 route；寫下 public 與 private subnet 的唯一差別
- [ ] **四**　建一個 security group：22 只對自己的 IP 開放、8080 對外開放；寫下 SG 與 NACL 的兩個差異
- [ ] **五**　畫出 private subnet 經 NAT gateway 出網的路徑圖，並對照 Week 3 四的 Docker 實驗標出誰扮演同樣的角色（NAT gateway 按小時計費，這裡只畫不建；Week 37 會實際建出來驗證）

### Week 14 — EC2 與 ECR

**Focus：** 在自己建的網路裡跑起一個 container

**Key Topics：** EC2、key pair、instance role、ECR

- [ ] **一**　在自建 subnet 啟動一台 free-tier EC2，SSH 登入成功後 stop
- [ ] **二**　在 EC2 安裝 Docker 並跑 nginx，從瀏覽器看到頁面；連不上時用 Week 4 的排錯順序找原因
- [ ] **三**　只用 CLI 重做一次：`create-security-group`、`authorize-security-group-ingress`、`run-instances`，SSH 登入成功後 terminate 這一台
- [ ] **四**　建一個 ECR repository，用 `aws ecr get-login-password` 登入後 push `demo-app` 的 image
- [ ] **五**　給週一那台 EC2 掛上 instance role，讓它不放任何 access key 就能從 ECR pull `demo-app` 並執行，`/health` 回 200；結束後 stop（Week 15 還要用）

### Week 15 — 從 Jenkins 部署到 EC2

**Focus：** 把 CI 接上 CD

**Key Topics：** SSH agent、遠端部署、docker compose 部署

> 這週 image 仍由 pipeline 推到 Week 5 的私有 repository；ECR 要到 Week 30 才接進 pipeline。

- [ ] **一**　啟動 Week 14 的 EC2（public IP 會變）；在 Jenkins 加入它的 SSH key credential，pipeline 內成功 `ssh` 執行 `hostname`
- [ ] **二**　deploy stage：SSH 到 EC2，用 Week 8 的 registry credential `docker login` 後 `docker run` 啟動新的 image；`curl http://<EC2-IP>:8080/health` 回 200
- [ ] **三**　改成 compose：把 Week 5 的 compose 檔 `scp` 過去再 `docker compose up -d`，app 與 db 都在跑
- [ ] **四**　把遠端指令抽成 `server-cmds.sh`，由 pipeline 傳入 image tag
- [ ] **五**　端到端驗證：push 程式碼 → 版本遞增 → 新 image → EC2 上的服務更新，全程不手動介入；結束後 terminate EC2

### Week 16 — AWS Checkpoint 與 IaC 前導

**Focus：** 清乾淨，並親身體會為什麼需要 Infrastructure as Code

**Key Topics：** 資源清理、命令式腳本的限制、冪等性

- [ ] **一**　清點並刪除所有資源（EC2、Elastic IP、EBS、ECR image、自建 VPC），確認帳單
- [ ] **二**　寫 `create-infra.sh`：用 AWS CLI 建 security group 與 EC2，執行後 SSH 登入成功
- [ ] **三**　寫 `destroy-infra.sh`，再把 create 連跑兩次，記下遇到的問題（順序、重複建立、不知道現況）
- [ ] **四**　改寫 `create-infra.sh`，讓它連跑兩次不報錯也不重複建立（先查詢是否已存在）。記下為此多寫了幾行、還有哪些情況沒處理，並用三句話寫下 declarative 與 imperative 的差別——這份紀錄 Week 31 會用到
- [ ] **五**　**Checkpoint（30 分鐘、不看筆記，可查官方文件）：** 從零建出 VPC → public subnet → internet gateway 與 route → security group → EC2。通過條件：SSH 登入成功，然後全部刪除、帳單無殘留。另外回答一題沒看過的：把 10.1.0.0/16 切出 3 個 /20，寫出各自的範圍

### Part 2：Container Orchestration with Kubernetes

> 這個階段部署的都是 Jenkins pipeline 產出的 `demo-app` image。每次需要新版本就改程式碼、push、讓 pipeline 跑，Jenkins 才不會放到生疏。

### Week 17 — 核心概念與環境

**Focus：** 有一個可以動手的 cluster，並認得每個元件

**Key Topics：** control plane 與 worker node、Pod、Deployment、ReplicaSet、基本排錯指令

- [ ] **一**　安裝 minikube（或 kind）與 kubectl，`kubectl get nodes` 顯示 Ready
- [ ] **二**　`kubectl get pods -n kube-system`，把每個 pod 對應到架構元件（api server、scheduler、controller manager、etcd、kube-proxy）並寫下各自的職責
- [ ] **三**　`kubectl create deployment` 部署 nginx，觀察 Deployment → ReplicaSet → Pod 的階層
- [ ] **四**　刪掉一個 pod 觀察它被重建；練習 `describe`、`logs`、`exec`、`get -o wide`
- [ ] **五**　故意填錯 image 名稱，從 `ImagePullBackOff` 用 `describe` 找出原因並修好

### Week 18 — YAML 與 Service

**Focus：** 手寫設定檔，並讓 Pod 可以被連到

**Key Topics：** manifest 結構、labels 與 selector、Service 類型、port 對應、namespace

- [ ] **一**　手寫 `deployment.yaml`（apiVersion、kind、metadata、spec、template），`kubectl apply` 成功
- [ ] **二**　寫 ClusterIP 的 `service.yaml`，用 `kubectl get endpoints` 確認；再故意改錯 selector，重現測驗題的情境
- [ ] **三**　畫出 `port`、`targetPort`、`containerPort`、`nodePort` 的關係；用 `port-forward` 連到服務
- [ ] **四**　把 Service 依序改成 NodePort 與 LoadBalancer，用 `minikube service` 或 `minikube tunnel` 從瀏覽器連到
- [ ] **五**　建 `dev` namespace 部署同一份 YAML；從另一個 namespace 用 `<service>.<namespace>.svc.cluster.local` 連線成功

### Week 19 — 設定與第一個完整應用

**Focus：** 把 `demo-app` 和它的資料庫部署到 cluster

**Key Topics：** ConfigMap、Secret、`imagePullSecrets`、內部與外部 Service

- [ ] **一**　建一個 ConfigMap，分別用環境變數與 volume 兩種方式給 Pod 使用
- [ ] **二**　建一個 Secret 並以環境變數引用；`base64 -d` 解回原值，寫下「為什麼 Secret 不等於加密」
- [ ] **三**　部署 MongoDB：Deployment + 內部 Service + Secret
- [ ] **四**　部署 pipeline 產出的 `demo-app` image：先不給憑證，看到 Week 17 五的 `ImagePullBackOff`；再建立 `docker-registry` 類型的 Secret 並用 `imagePullSecrets` 修好。資料庫位址用 ConfigMap 指向 MongoDB 的 Service 名稱
- [ ] **五**　加一個對外 Service，透過 `demo-app` 寫入一筆資料並讀回；所有 YAML 整理進 `demo-app` repo 的 `k8s/`

### Week 20 — Ingress 與 TLS

**Focus：** 用網域名稱與 HTTPS 對外提供服務

**Key Topics：** Ingress、Ingress controller、routing rule、TLS secret

- [ ] **一**　`minikube addons enable ingress`；寫下 Ingress 與 LoadBalancer Service 的差別
- [ ] **二**　寫一條 host-based 的 Ingress rule，改 `/etc/hosts` 後用網域名稱連到 `demo-app`
- [ ] **三**　同一個 host 下用 path 把流量分到兩個不同的 Service（`demo-app` 與 Week 18 的 nginx）
- [ ] **四**　產生自簽憑證、建立 TLS secret，`curl -k https://<網域>/health` 回 200
- [ ] **五**　發一個請求，用 `kubectl logs` 在 Ingress controller 與 `demo-app` 各找到它的紀錄；畫出 browser → Ingress controller → Service → Pod 的請求路徑

### Week 21 — 儲存與 StatefulSet

**Focus：** 讓資料在 Pod 重建後還在

**Key Topics：** PV、PVC、StorageClass、設定檔掛載、StatefulSet、headless Service

- [ ] **一**　`kubectl get sc` 查看 StorageClass；建一個 PVC 觀察 PV 被動態建立
- [ ] **二**　先刪掉 Week 19 的 MongoDB Pod，確認資料不見了；掛上 PVC 後重做一次，確認資料還在
- [ ] **三**　把 `demo-app` 的一份設定檔用 ConfigMap、一份憑證檔用 Secret 掛成檔案，`kubectl exec` 進去 `cat` 確認內容
- [ ] **四**　部署 2 個 replica 的 StatefulSet，觀察固定名稱（`-0`、`-1`）、各自的 PVC、依序啟動
- [ ] **五**　加上 headless Service，從另一個 Pod 用 `nslookup` 解析出單一 Pod 的 DNS 名稱

### Week 22 — Helm

**Focus：** 用套件管理取代一堆零散的 YAML

**Key Topics：** chart、release、repository、values、templating

- [ ] **一**　安裝 Helm，`helm repo add` 一個 repository，在 Artifact Hub 找到一個 chart 並讀它的 values
- [ ] **二**　`helm install` 一個 chart，用 `helm list` 與 `helm status` 檢視
- [ ] **三**　用自己的 values 檔覆寫設定後 `helm upgrade`，再 `helm rollback` 回前一版
- [ ] **四**　`helm create` 產生一個 chart，用 `helm template` 看 templates 與 `values.yaml` 如何組合
- [ ] **五**　把 Week 19–21 的 `demo-app` 與 MongoDB 包成自己的 chart，用兩份 values 部署到 `dev` 與 `staging` namespace，兩邊的 `/health` 都回 200

### Week 23 — RBAC 與其他 Workload 類型

**Focus：** 存取控制，以及 Deployment 之外的 workload

**Key Topics：** Role、RoleBinding、ServiceAccount、kubeconfig、DaemonSet、CronJob

- [ ] **一**　建一個只能讀 pods 的 Role 與一個 ServiceAccount，用 RoleBinding 綁起來
- [ ] **二**　用 `kubectl auth can-i --as=system:serviceaccount:<ns>:<sa>` 驗證：可以 get pods、不能 delete
- [ ] **三**　讓一個 Pod 使用這個 ServiceAccount，在 Pod 內呼叫 API：列出 pods 成功、刪除被拒（403）
- [ ] **四**　`kubectl config view` 讀懂 cluster、user、context 三段；寫下 K8s 如何驗證一個「人類使用者」
- [ ] **五**　各部署一個 DaemonSet 與一個 CronJob：確認 DaemonSet 的 Pod 數等於 node 數、CronJob 每分鐘產生一個 Job，寫下各自的使用情境

### Week 24 — Production Best Practices

**Focus：** 讓 `demo-app` 能在正式環境存活

**Key Topics：** readiness 與 liveness probe、resource requests 與 limits、rolling update

- [ ] **一**　為 `demo-app` 加上指向 `/health` 的 readiness probe，故意讓它失敗，觀察 Pod 從 endpoints 被移除但沒有重啟（測驗題的實作）
- [ ] **二**　加上 liveness probe 並讓它失敗，觀察 restart count 增加
- [ ] **三**　設定 resource requests 與 limits；把 memory limit 設得過低，觀察 `OOMKilled`
- [ ] **四**　改一行程式碼並 push，讓 Jenkins pipeline 產出新 tag；用它做 rolling update，以 `kubectl rollout status` 觀察，再 `rollout undo`
- [ ] **五**　寫一份自查清單（固定 tag、probes、resources、replicas ≥ 2、非 root、Secret 不進 Git），拿自己的 chart 逐項檢查並修正

### Week 25 — Microservices 部署

**Focus：** 一次管理多個服務

**Key Topics：** 服務間溝通、共用 chart、Helmfile

- [ ] **一**　讀一個開源 microservices demo 的架構圖，列出每個服務的 port 與它依賴誰；用三句話寫下它和 `demo-app` 這種單體應用的差別
- [ ] **二**　為其中 3 個服務寫 Deployment 與 Service，用環境變數指向其他服務的 Service 名稱
- [ ] **三**　補上其餘服務並部署到 minikube（資源不夠就只跑能互通的子集）
- [ ] **四**　改成一個共用 chart 加上每個服務一份 values 檔
- [ ] **五**　寫 `helmfile.yaml` 管理所有 release，`helmfile sync` 一次部署

### Week 26 — Kubernetes Checkpoint

**Focus：** 排錯與獨立完成

- [ ] **一**　排錯演練：製造一個 `CrashLoopBackOff`（錯誤的環境變數），用 `logs --previous` 找到原因
- [ ] **二**　排錯演練：製造 Service 連不到（port 寫錯）與 Pod `Pending`（requests 過大），各自找出原因
- [ ] **三**　排錯演練：製造 readiness probe 路徑寫錯（Pod Running 但 endpoints 是空的）與少了 `imagePullSecrets`，各自找出原因
- [ ] **四**　整理自己的 kubectl cheat sheet；各寫出一個「只該用 readiness」與「需要 liveness」的實際情境（測驗題的延伸）
- [ ] **五**　**Checkpoint（30 分鐘、不看筆記）：** 在一個空的 namespace 手寫 YAML 部署 `demo-app` + MongoDB + Ingress，含 probes 與 resources。通過條件：用網域名稱能寫入並讀回一筆資料，且 `kubectl get endpoints` 不是空的

### Part 3：Kubernetes on AWS (EKS)

> 這個階段的動手項目會產生費用（EKS control plane 每小時約 0.10 美元，另加 node 與 load balancer）。每次建立的 cluster 都在同一個時段內刪除。

### Week 27 — AWS Container 服務與準備

**Focus：** 動手前把架構、費用與部署檔都準備好

**Key Topics：** ECS、EKS、Fargate、ECR 的定位，EKS 的 IAM role 與網路需求，autoscaling

- [ ] **一**　寫兩張表：ECS、EKS、Fargate 的比較（誰管 control plane、誰管 node、適合什麼情境）；managed 與 self-managed cluster 在儲存與 load balancer 上的差別
- [ ] **二**　安裝 eksctl，寫好 `cluster.yaml`（2 個小型 node），`eksctl create cluster -f cluster.yaml --dry-run` 通過
- [ ] **三**　寫一份預測清單，Week 28 逐項對答案：eksctl 會替你建哪些資源、LoadBalancer Service 在 EKS 上會變成什麼、跑一小時要多少錢。再寫下自己的規則：當次建、當次刪、刪完檢查 load balancer 與 EBS
- [ ] **四**　在 minikube 啟用 metrics-server，用 `kubectl autoscale` 為 `demo-app` 建 HPA，打流量讓 replicas 增加；寫下 HPA 與 cluster autoscaler 各自擴的是什麼
- [ ] **五**　把 `demo-app` 的 chart 準備一份 EKS 用的 values（Service 改成 LoadBalancer、StorageClass 改成 EKS 的），`helm template` 輸出正確

### Week 28 — EKS 動手 ⏱

**Focus：** 建立真正的 cluster 並對外提供服務

- [ ] **一 + 二 ⏱（合併成一次約 60–75 分鐘）**　`eksctl create cluster -f cluster.yaml` → `kubectl get nodes` → 用 Week 27 五的 values 部署 `demo-app` → 從瀏覽器連到 load balancer 的網址 → `eksctl delete cluster`
- [ ] **三**　到 CloudFormation 檢視已刪除的 stack，對照 Week 27 三的預測清單，標出猜對的與漏掉的資源
- [ ] **四 + 五 ⏱（合併成一次約 60–75 分鐘）**　重建 cluster → 把 replicas 加到 Pod 出現 `Pending` → `eksctl scale nodegroup` 加 node 後觀察 Pod 被排入 → 刪除 cluster

### Week 29 — 從 Jenkins 部署到 EKS ⏱

**Focus：** 讓 pipeline 能對 cluster 下指令

**Key Topics：** kubeconfig、EKS 驗證、在 pipeline 中套用 manifest

- [ ] **一**　在 Jenkins container 內安裝 kubectl 與 AWS CLI，pipeline 內 `kubectl version --client` 與 `aws --version` 成功；寫下 kubectl、kubeconfig、AWS 身分驗證這三樣各自從哪裡來
- [ ] **二**　準備一份 image tag 用變數的 `deployment.yaml`；在本機用 `envsubst | kubectl apply -f -` 對 minikube 部署成功
- [ ] **三**　在 Jenkins 加入 AWS credentials 並寫好 deploy stage（`aws eks update-kubeconfig` 後 `envsubst | kubectl apply`）。cluster 還沒建，今天先驗證兩件事：pipeline 內 `aws sts get-caller-identity` 成功、`envsubst` 印出的 manifest 帶著正確的 image tag
- [ ] **四 + 五 ⏱（合併成一次約 60–75 分鐘）**　建 cluster → 跑 pipeline 完成部署 → load balancer 上的 `/health` 回 200 → 刪除 cluster

### Week 30 — 完整 CI/CD 與 Level 3 Checkpoint ⏱

**Focus：** 把 Level 3 學過的全部接成一條線

- [ ] **一**　pipeline 改成 push 到 ECR（Week 14 四、五做過手動版），在 ECR 看到新 tag；寫下 EKS 從 ECR 與從私有 repository 拉 image 在驗證上的差別
- [ ] **二**　把 Jenkins 用的 IAM 權限縮到最小，重跑 pipeline 仍能 push；寫下三條 credential 管理原則
- [ ] **三 + 四 ⏱（合併成一次約 60–75 分鐘）**　**Checkpoint：** 建 cluster → 改一行程式碼並 push。通過條件：之後不手動介入，pipeline 跑完版本遞增 → build → push ECR → 部署到 EKS → 版本 commit 回 Git，且 load balancer 上看得到這次的變更 → 刪除 cluster
- [ ] **五**　畫出整條 CI/CD 架構圖，在每個箭頭上標出用的是哪一個 credential；檢查帳單與殘留資源（load balancer、EBS、ECR image）

---

## Level 4 — DevOps Advanced

### Part 1：Infrastructure as Code with Terraform

### Week 31 — Terraform 入門

**Focus：** 用程式碼建立第一個資源

**Key Topics：** provider、resource、data source、`init`、`plan`、`apply`、`destroy`

- [ ] **一**　安裝 Terraform 與編輯器外掛，寫 AWS provider 設定，`terraform init` 成功；拿出 Week 16 三、四的紀錄，逐條寫下你預期 Terraform 會怎麼處理
- [ ] **二**　寫一個 `aws_vpc`，`plan` → `apply`，在 console 看到它；再 `apply` 一次，確認顯示 No changes（對照 Week 16 四你為冪等多寫的那些行）
- [ ] **三**　加一個引用該 VPC 的 `aws_subnet`；改 tag 與改 CIDR 各 plan 一次，比較 in-place 更新與 replace
- [ ] **四**　用 data source 查出 default VPC 的 id 並輸出
- [ ] **五**　`terraform destroy`；回頭核對週一的預期，寫下哪幾條對了、哪幾條和想的不一樣

### Week 32 — State、Variables、Outputs

**Focus：** 理解 Terraform 怎麼知道現況

**Key Topics：** state 檔、drift、變數的各種給法、outputs

- [ ] **一**　apply 後打開 `terraform.tfstate` 閱讀；練習 `terraform state list` 與 `state show`
- [ ] **二**　在 console 手動改一個 tag，再 `terraform plan` 觀察它如何發現差異
- [ ] **三**　用四種方式給同一個變數值：預設值、`terraform.tfvars`、`-var`、`TF_VAR_` 環境變數，確認優先順序
- [ ] **四**　加上 outputs；寫好 `.gitignore`（`.terraform/`、`*.tfstate*`、含敏感值的 tfvars）
- [ ] **五**　把專案完全參數化（CIDR、環境前綴、AZ），用兩組 tfvars 各 apply 與 destroy 一次

### Week 33 — 網路與 EC2

**Focus：** 用 Terraform 重建 Week 13–14 手動做過的東西

**Key Topics：** route table、security group、AMI data source、key pair、EC2

- [ ] **一**　加上 internet gateway、route table 與 association；`plan` 顯示 3 to add，apply 後在 console 看到 `0.0.0.0/0` 的 route
- [ ] **二**　加上 security group（22 只對自己的 IP、8080 對外）；apply 後用 `aws ec2 describe-security-groups` 確認兩條 ingress 規則
- [ ] **三**　用 `data "aws_ami"` 查最新的 Amazon Linux 並 output 它的 id；建立 `aws_key_pair`
- [ ] **四**　建立 `aws_instance`，output 它的 public IP，SSH 登入成功
- [ ] **五**　destroy；把程式碼拆成 `providers.tf`、`main.tf`、`variables.tf`、`outputs.tf`，`plan` 顯示的資源數量和拆之前相同

### Week 34 — Provisioning

**Focus：** 機器建好後自動完成設定

**Key Topics：** `user_data`、`remote-exec`、`file`、`local-exec`

- [ ] **一**　用 `user_data` 安裝 Docker 並跑 nginx，apply 後直接從瀏覽器看到頁面
- [ ] **二**　把 `user_data` 抽成 `entry-script.sh`，用 `file()` 載入，結果與昨天相同
- [ ] **三**　用 `remote-exec` 加 `connection` 區塊做同一件事
- [ ] **四**　用 `file` provisioner 複製檔案、`local-exec` 在本機執行指令
- [ ] **五**　destroy；寫下 `user_data` 與 provisioner 各自適用的時機，以及 provisioner 為什麼是最後手段

### Week 35 — Modules

**Focus：** 讓程式碼可以重複使用

**Key Topics：** module 結構、輸入變數、輸出值、registry 上的 module

- [ ] **一**　讀 Terraform Registry 上 VPC module 的 inputs 與 outputs；寫下 module 解決什麼問題
- [ ] **二**　把 subnet 相關資源抽成 `modules/subnet`
- [ ] **三**　把 EC2 相關資源抽成 `modules/webserver`，用 subnet module 的 output 當它的 input
- [ ] **四**　root module 呼叫這兩個 module，`plan` 成功且資源數量與模組化前相同
- [ ] **五**　apply 與 destroy 驗證；跑 `terraform fmt` 與 `terraform validate`

### Week 36 — Remote State 與 Best Practices

**Focus：** 多人協作時 state 該怎麼管（測驗題）

**Key Topics：** S3 backend、state locking、state 管理原則

- [ ] **一**　寫下 local state 在團隊中的三個問題，以及 remote backend 與 locking 各解決哪一個
- [ ] **二**　建一個開啟 versioning 的 S3 bucket，設為 backend，`terraform init -migrate-state`，確認 state 在 bucket 裡
- [ ] **三**　啟用 state locking，開兩個 terminal 同時 apply，觀察其中一個被擋下
- [ ] **四**　寫下自己的 best practices 清單：不手改 state、state 不進 Git、固定 provider 版本、每個環境獨立的 state；拿自己的專案逐項檢查並修正
- [ ] **五**　刪掉本機的 `.terraform/` 與 state 檔，重新 `init` 後 `plan` 顯示 No changes，證明 state 真的在遠端；重答 Terraform 測驗題並寫下理由；destroy 練習資源

### Week 37 — 用 Terraform 建 EKS ⏱

**Focus：** 用現成的 module 建出完整的 cluster

**Key Topics：** VPC module、EKS module、managed node group

- [ ] **一**　讀 VPC module 與 EKS module 的文件，列出各自必填的 inputs
- [ ] **二**　寫 `vpc.tf`：public 與 private subnets、NAT gateway、EKS 需要的 subnet tags；`plan` 通過
- [ ] **三**　寫 `eks.tf`：cluster 版本與一個放在 private subnet 的 managed node group；`plan` 通過，先不 apply
- [ ] **四 + 五 ⏱（合併成一次約 75 分鐘）**　apply → `aws eks update-kubeconfig` → 部署 `demo-app` → 在 Pod 內執行 `curl ifconfig.me`，確認回傳的是 NAT gateway 的 Elastic IP（Week 13 五那張圖的實際驗證）→ destroy

### Week 38 — Terraform in CI/CD 與 Checkpoint

**Focus：** 由 pipeline 建立基礎設施再部署

**Key Topics：** pipeline 中執行 Terraform、stage 之間傳遞 output

- [ ] **一**　在 Jenkins container 安裝 Terraform，確認 pipeline 內 `terraform version` 可執行
- [ ] **二**　加 provision stage：`init` 與 `apply -auto-approve`，把 EC2 的 IP 用 `terraform output` 存成環境變數並印出
- [ ] **三**　deploy stage：等機器就緒後 SSH 過去用 compose 部署 `demo-app`，`/health` 回 200
- [ ] **四**　跑完整 pipeline 一次，驗證後 destroy
- [ ] **五**　**Checkpoint（30 分鐘、不看筆記）：** 從空資料夾開始寫出 VPC + subnet + security group + EC2。通過條件：apply 成功、SSH 登入成功、再 apply 一次顯示 No changes，然後 destroy

### Part 2：Python 與自動化

### Week 39 — Python 基礎語法

**Focus：** 能寫出會處理錯誤輸入的小程式

**Key Topics：** 變數、函式、使用者輸入、條件、例外處理、迴圈

- [ ] **一**　安裝 Python 並建立 venv；寫 `main.py` 練習 `print`、字串與數字運算、變數
- [ ] **二**　寫一個函式，把天數換算成小時並回傳結果
- [ ] **三**　加上 `input()` 與型別轉換，用 `if` / `elif` / `else` 拒絕負數與 0
- [ ] **四**　用 `try` / `except` 處理非數字輸入；包進 `while True`，輸入 `exit` 才結束
- [ ] **五**　整理成一支完整的小程式，輸出改用 f-string；依序輸入正數、0、負數、文字、`exit`，五種都得到預期的回應

### Week 40 — 資料結構

**Focus：** 熟悉 list、set、dict（測驗題）

**Key Topics：** list、set、dictionary、走訪與篩選

- [ ] **一**　練習 list：索引、`append`、`for` 迴圈、`split`；讓上週的程式一次接受多個以逗號分隔的值
- [ ] **二**　練習 set：把含重複值的 list 轉成 set，比較兩者的 `len`
- [ ] **三**　練習 dict：建立、取值、`.get(key, default)`、用 `.items()` 走訪
- [ ] **四**　用一個 list of dicts 模擬 server 清單，篩選出 `status` 為 `down` 的項目
- [ ] **五**　**Checkpoint（30 分鐘、不看筆記）：** 用 20 行以內的 Python 重寫 Week 2 的 `log-report.sh`，統計同一個 log 檔中各 status 的次數。通過條件：數字和 bash 版本一致。另外重答 Python 測驗題並逐步說明

### Week 41 — 模組、檔案、OOP、API

**Focus：** 寫出能跟外部世界互動的程式

**Key Topics：** 標準函式庫、pip、檔案與 JSON、class、`requests`

- [ ] **一**　用 `datetime` 算出距離某個日期還有幾天；用 pip 安裝一個第三方套件並 import
- [ ] **二**　讀一個 JSON 檔、修改一個欄位、寫回去
- [ ] **三**　寫 `User` 與 `Post` 兩個 class（`__init__`、`self`、方法），讓 user 可以新增 post
- [ ] **四**　用 `requests` 呼叫一個公開的 Git 平台 API，印出某個帳號的所有 repository 名稱
- [ ] **五**　把 Week 2 的 `healthcheck.sh` 用 Python 重寫，保留 exit code 行為；對 `demo-app` 的 `/health` 與一個不存在的路徑各跑一次

### Week 42 — boto3 入門

**Focus：** 用 Python 操作 AWS

**Key Topics：** client 與 resource、讀官方文件、查詢與修改資源

> Week 42–44 需要 EC2 當操作對象：每次開始時用 Week 35 的 Terraform module apply 出 1–2 台，結束時 destroy。

- [ ] **一**　安裝 boto3，列出所有 VPC 的 id 與 CIDR
- [ ] **二**　從官方文件找出 `describe_instances` 的回傳結構，印出每台 instance 的 id 與狀態
- [ ] **三**　用 `describe_instance_status` 加上排程套件，每隔幾秒印一次狀態；中途 stop 一台，看到輸出跟著改變
- [ ] **四**　用 boto3 建立一個 VPC 與兩個 subnet，確認後再用程式刪除
- [ ] **五**　寫一支腳本替某個 region 的所有 instance 加上 `environment` tag；用 Week 12 五的 `--query` 寫法確認 tag 都加上了

### Week 43 — 自動化：備份與還原

**Focus：** 寫出可以排程執行的維運腳本

**Key Topics：** EBS volume、snapshot、清理策略、還原

- [ ] **一**　替帶有特定 tag 的 volume 建立 snapshot；用 `describe_snapshots` 列出它
- [ ] **二**　把它改成排程執行，讓它跑完至少兩輪，確認每輪都多出一份 snapshot
- [ ] **三**　寫清理腳本：每個 volume 只保留最新的 2 份 snapshot；執行後確認剩下的數量
- [ ] **四**　從最新的 snapshot 建立 volume 並 attach 到 instance；SSH 進去用 `lsblk` 看到它
- [ ] **五**　加上例外處理與 log 輸出，故意給一個不存在的 volume id 確認腳本不會中斷；刪除所有練習用的 volume 與 snapshot

### Week 44 — 自動化：監控與 Checkpoint

**Focus：** 偵測到問題並自動修復

**Key Topics：** 網站監控、email 通知、遠端執行指令

> 這週的監控對象：用 Week 34 的 `user_data` 在 EC2 上起一個 container。

- [ ] **一**　從 Week 41 五的 healthcheck 出發，改成持續檢查 EC2 上的服務，非 200 就印出警告；手動停掉 container 確認警告出現
- [ ] **二**　失敗時寄出 email，帳號密碼從環境變數讀取；實際收到一封
- [ ] **三**　失敗時用 SSH 函式庫登入主機重啟 container；停掉 container 後不手動介入，服務自己恢復
- [ ] **四**　仍然失敗時重啟整台主機，等它就緒後再啟動 container
- [ ] **五**　**Checkpoint（30 分鐘、不看筆記）：** 寫一支腳本列出所有 region 中正在執行的 EC2。通過條件：先在兩個不同 region 各開一台，腳本兩台都列得出來；之後每個 AWS 週次結束都用它檢查有沒有忘記關的機器

### Part 3：Configuration Management with Ansible

### Week 45 — Ansible 入門

**Focus：** 從 control node 管理遠端主機

**Key Topics：** agentless 架構、inventory、module、playbook、冪等性

> Week 45–47 的受控主機：每次開始時用 Week 35 的 Terraform module apply 出 2 台 EC2，結束時 destroy。

- [ ] **一**　安裝 Ansible；寫下它如何連到受控主機、受控端需要什麼（測驗題），以及「冪等」和 Week 16 四、Week 31 二看到的是不是同一件事
- [ ] **二**　用 Terraform 啟動 2 台 EC2，寫 inventory 檔（使用者與 private key），`ansible all -m ping` 成功
- [ ] **三**　用 ad-hoc 指令查詢所有主機的磁碟用量；把主機分組並設定 group 變數
- [ ] **四**　寫第一個 playbook 安裝並啟動 nginx；連跑兩次，第二次應顯示 `changed=0`
- [ ] **五**　寫 `ansible.cfg` 指定預設 inventory；從 Ansible Galaxy 安裝一個 collection 並查它的 module 文件

### Week 46 — 部署應用程式

**Focus：** 用 playbook 把 `demo-app` 直接部署到主機上（不透過 container）

**Key Topics：** 套件安裝、檔案複製、啟動應用、非 root 執行、變數

- [ ] **一**　playbook 安裝 `demo-app` 的 runtime（例如 Node.js 與 npm）；用 ad-hoc 指令查版本確認
- [ ] **二**　複製並解壓 `demo-app` 的壓縮檔、安裝依賴；連跑兩次，第二次 `changed=0`
- [ ] **三**　啟動應用，用 `register` 與 `debug` 印出行程狀態，再用 `uri` module 確認 `/health` 回 200
- [ ] **四**　建立專用的 Linux 使用者，改用 `become_user` 以非 root 執行應用；用 `ps` 確認行程的擁有者
- [ ] **五**　把版本、路徑、使用者名稱改成變數，分別用 vars 檔與 `-e` 傳入，各部署成功一次

### Week 47 — 較複雜的 Playbook

**Focus：** 把一份 shell 安裝腳本翻成冪等的 playbook

**Key Topics：** 下載與解壓、權限、設定檔修改、條件與迴圈、驗證

- [ ] **一**　選一個需要下載、解壓、設定的服務（例如 Nexus），完成下載與解壓的 tasks，用 `find` 取得解壓後的目錄名
- [ ] **二**　建立使用者與群組、遞迴設定目錄擁有者、用 `lineinfile` 或 `blockinfile` 修改設定檔
- [ ] **三**　啟動服務，用 `wait_for` 等 port 開啟再驗證
- [ ] **四**　用 `stat` 加 `when` 讓「已安裝就跳過」；用 `loop` 合併重複的 tasks
- [ ] **五**　整份 playbook 在全新主機上連跑兩次都沒有錯誤，第二次 `changed=0`

### Week 48 — Docker、Terraform 整合與 Dynamic Inventory

**Focus：** 讓 Ansible 接上前面學的工具

**Key Topics：** Docker 相關 module、Terraform 觸發 Ansible、`aws_ec2` inventory plugin

- [ ] **一**　playbook 安裝 Docker 與 compose，把使用者加入 docker 群組並讓它在同一次執行中生效；該使用者不用 sudo 就能 `docker ps`
- [ ] **二**　用 Docker 相關的 Ansible module 登入 registry 並用 compose 檔啟動 `demo-app`，`/health` 回 200
- [ ] **三**　Terraform 建好 EC2 後用 `local-exec` 自動執行 playbook（先等 SSH port 開啟）；寫下 Terraform 與 Ansible 各自負責什麼，以及這和 Week 34 的 `user_data`、provisioner 相比何時該用哪一個
- [ ] **四**　設定 `aws_ec2` dynamic inventory，`ansible-inventory --graph` 列出 EC2
- [ ] **五**　用 `keyed_groups` 依 tag 分組，playbook 只對 `dev` 群組執行；結束後 destroy

### Week 49 — Roles、Kubernetes、Jenkins 與 Checkpoint

**Focus：** 組織 playbook，並放進 pipeline

**Key Topics：** roles、Kubernetes module、由 pipeline 執行 playbook

- [ ] **一**　把上週的 playbook 拆成 roles（tasks、vars、files、handlers），執行結果與拆之前相同
- [ ] **二**　用 Ansible 的 Kubernetes module 在本機 cluster 建一個 namespace 並部署 `demo-app`
- [ ] **三**　寫 Jenkinsfile：把 playbook 複製到 control node 並透過 SSH 執行；今天先讓 `ansible-playbook --syntax-check` 與 `--check` 通過
- [ ] **四**　實際跑一次這條 pipeline 並修到全綠
- [ ] **五**　**Checkpoint（30 分鐘、不看筆記）：** 從空資料夾寫一份 playbook，把一台全新的 VM 變成跑著 `demo-app` 的主機。通過條件：`/health` 回 200，且連跑第二次 `changed=0`。另外重答 Ansible 測驗題

### Part 4：Monitoring with Prometheus

> 這個階段全部在本機 cluster 完成，不需要 EKS。監控對象是 Week 22 的 `demo-app` chart。

### Week 50 — 架構與安裝

**Focus：** 把監控堆疊跑起來並會查資料

**Key Topics：** pull 模型、target、`/metrics`、exporter、Operator 與 CRD、PromQL、Grafana

- [ ] **一**　畫出 Prometheus 架構圖：server、targets、exporter、Alertmanager，標出誰主動連誰
- [ ] **二**　用 Helm 安裝 kube-prometheus-stack，列出裝了哪些元件以及各自是 Deployment、StatefulSet 還是 DaemonSet（對照 Week 21、23）；`kubectl get crd` 找出它裝的 CRD，用三句話寫下 Operator 是什麼
- [ ] **三**　port-forward 開啟 Prometheus UI，在 Targets 頁面確認各 target 的狀態，執行第一個查詢
- [ ] **四**　練習 PromQL：用 label 篩選、`rate()`、`sum by()`，查出各 node 的 CPU 使用率
- [ ] **五**　登入 Grafana，打開一個內建 dashboard，找出其中一個 panel 背後的 PromQL，貼到 Prometheus UI 得到相同的數字

### Week 51 — Alert

**Focus：** 出問題時會收到通知

**Key Topics：** alert rule 結構、`PrometheusRule`、Alertmanager 的 route 與 receiver

- [ ] **一**　讀三條內建的 alert rule，說出 `expr`、`for`、`labels`、`annotations` 各自的作用
- [ ] **二**　寫一條 `PrometheusRule`：CPU 使用率超過 50% 持續 2 分鐘，確認它出現在 Alerts 頁面
- [ ] **三**　再寫一條 Pod 重啟次數的 rule；用 Week 24 的手法讓 `demo-app` 的 liveness probe 失敗，看到 alert 從 pending 變成 firing
- [ ] **四**　設定 Alertmanager 的 receiver（email 或 webhook）與 route
- [ ] **五**　再次觸發 alert，實際收到通知

### Week 52 — Exporter 與自訂指標

**Focus：** 監控第三方服務與自己的應用

**Key Topics：** exporter、`ServiceMonitor`、client library、自製 dashboard

- [ ] **一**　為 `demo-app` 的資料庫部署對應的 exporter（MongoDB exporter），建立 `ServiceMonitor` 讓它出現在 Targets（測驗題的實作）
- [ ] **二**　為資料庫寫兩條 alert rule：服務掛掉、連線數過高；把資料庫 scale 到 0，看到第一條 firing
- [ ] **三**　匯入一個社群的資料庫 dashboard 到 Grafana，確認 panel 有資料
- [ ] **四**　在 `demo-app` 中用 client library 暴露 `/metrics`，包含請求數與請求時間；push 後由 pipeline 產出新 image 並部署
- [ ] **五**　為 `demo-app` 建立 `ServiceMonitor`，做一個顯示每秒請求數與延遲的 dashboard；打一波流量，看到曲線上升

### Week 53 — 總結

**Focus：** 驗收與盤點

- [ ] **一**　重做 2026-10-10 的全部測驗題，每題都要能說出理由，並指出是哪一週的哪個實作讓你確定答案
- [ ] **二**　畫一張總架構圖：程式碼 → Jenkins → image → Terraform 建的基礎設施 → Kubernetes → 監控，每一段標上 `demo-app` repo 裡對應的檔案
- [ ] **三**　整理各階段產出的 repo，補上 README
- [ ] **四**　回頭看「刻意略過的內容」，挑出想補的項目排成下一份清單
- [ ] **五**　用 Week 44 五的腳本檢查所有 region 的殘留資源，並確認帳單

---

## 進度紀錄

| 階段 | 完成日期 | Checkpoint 結果 | 備註 |
|---|---|---|---|
| A　Level 1 補洞（Week 1–4） | | | |
| B　Docker 鞏固（Week 5） | | | |
| C　Jenkins（Week 6–11） | | | |
| D　AWS（Week 12–16） | | | |
| E　Kubernetes（Week 17–26） | | | |
| F　EKS（Week 27–30） | | | |
| G　Terraform（Week 31–38） | | | |
| H　Python（Week 39–44） | | | |
| I　Ansible（Week 45–49） | | | |
| J　Prometheus（Week 50–53） | | | |
