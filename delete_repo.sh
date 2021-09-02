# 将 DELETE_KOKEN 和 GithubName 都替换为自己的
DELETE_KOKEN="ghp_VjF1qU762551823Lt7uoMvxlGSmvfFbsO2dgbfg"
GithubName="xxxx"

for repName in $(cat repos.txt)
do
    echo "Delete "$repName
    curl -XDELETE -H "Authorization: token ${DELETE_KOKEN}" https://api.github.com/repos/${GithubName}/${repName}
done