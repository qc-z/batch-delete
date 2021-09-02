---
theme: channing-cyan
---

## 使用背景

1 创建的仓库太多了，有一些无用的或者废弃的

2 fork 了别人的项目，后面不想要了

大家应该都有在 github 删除仓库的经历吧，数量少还好，数量多的话真的让人崩溃，
github 为了不让你误操作，特意在删除的时候还要手动输入仓库名字

![2019092501356020.jpeg](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/990e2795a0594a3489b12383b3837bc4~tplv-k3u1fbpfcp-watermark.image)

## 步骤

1. 创建 token

   1). 创建 token 位置： github.com -> 点击头像 -> Settings -> Developer settings -> Personal access tokens [点击创建 token](https://github.com/settings/tokens)

   2). 点击 Generate new token，并输入密码

   3). Note 处输入标记这个 token 是做什么的名字，比如：DELETE_TOKEN

   4). 往下滑动找到  `delete_repo`  勾选
   ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/104f788e868e4f11891e95491408ebc0~tplv-k3u1fbpfcp-watermark.image)

   5). Generate token 创建完成并复制。

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/976ba24b1a2e4c07bd9474b0b47b0d77~tplv-k3u1fbpfcp-watermark.image)

2. **懒人版本 (3,4 步创建文件可以忽略，修改 DELETE_KOKEN 和 DELETE_KOKEN 和要删除的仓库名字即可)**

```js
git clone https://github.com/qc-z/batch-delete.git
cd batch-delete
```

3. 新建文件夹 batch-delete(自己起的名字), 新建**delete_repo.sh** 文件

**将 DELETE_KOKEN 和 GithubName 都替换为自己的参数**

在命令行输入，快速创建文件

```js
touch delete_repo.sh
```

内容

```js
# 将 DELETE_KOKEN 和 GithubName 都替换为自己的
DELETE_KOKEN="ghp_VjF1qU762551823Lt7uoMvxlGSmvfFbsO2dgbfg"
GithubName="xxxx"

for repName in $(cat repos.txt)
do
    echo "Delete "$repName
    curl -XDELETE -H "Authorization: token ${DELETE_KOKEN}" https://api.github.com/repos/${GithubName}/${repName}
done
```

4. 同级下新建 repos.txt,将要删除的仓库名称添加到 repos.txt 文件中

在命令行输入，快速创建文件

```js
touch repos.txt
```

**选名技巧：仓库名称左上空白处点击三下选中自带换行**

内容

```js
   repoName1
   repoName2
   ...
```

不用带上用户名

例如 repoName1

不是 用户名/repoName1

## 执行

命令行输入

```
./delete_repo.sh
```
