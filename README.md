# App-School-assignments-

- Week 1

Git& GitHub 

Q2

git status = 顯示repo 目前的工作狀態

git add = 在編輯檔案之後要執行的功能，可以把已修改的內容新增到repo

git commit = 再上傳到自己的github 之前，可以對自己剛剛所編輯的動作做簡單的紀錄說明

git log = 可以顯示編輯repo的所有歷史紀錄

git push = 將自己做的修改動作上傳到自己的Github

git remote -v = 想要將自己桌面所建立的檔案藉由git 上傳到GitHub 之前要做的初始化動作

git branch =

git fork =
 
Q3 Please describe how to establish a GitHub repo and how to upload the local projects to GitHub. Try to explain your answers with as much detail as possible.
建立GitHub repo 第一種[自己建立LICENSE & README.md]
1. cd Desktop
2. mkdir newfile
3. cd newfile
4. git init = create the new repo 
5. vim LICENSE = 建立License 
6. 輸入年份和姓名
7. check status 會發現有untracked file git 
8. git add newfile
9. vim README.md 
10. insert i = 做編輯
11.編輯完之後,esc [:wq]
12. 有了 LICENSE & README.md 就可以push 到自己的GitHub
13. 到GitHub 建立一個新的repo，copy http link
14. cd 到Desktop/newfile 
15. git remote add origin [paste http formed by new repo] 
16. git remote -vv [出現 fetch & push]
17. git push —set-upstream origin master
18. 在GitHub 上面建立一個新的token 並且copy 密碼 
19. 輸入 user name 和 token 密碼 
20. git status, log 檢查工作狀態
21. 去自己的Github 重新整理檢查是否有新增repo 成功
建立GitHub repo 第二種[clone]
1. 去自己的GitHub 建立新的repo 並且選擇LICENSE & README.md 
2. copy http link
3. cd Desktop
4. git clone [repo http link]
5. 新的repo 就會出現在locak Desktop

upload the local project to Github
waiting to finish

- Week 2 

- Week 3

- Week 4
 
