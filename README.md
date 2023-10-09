# 说明
下方为默认UUID，可自行添加环境变量修改
```
25bef25c-cbe4-431b-93b6-b39aa11c0a7e
```
# 部署
https://huggingface.co 注册账号，新建space，名称随意，选择docker，上传文件，除了README.md，其他文件都上传。
修改start.sh里的哪吒参数，不需要哪吒可忽略，自动部署 
![image](https://github.com/eoovve/Huggingface-ws/assets/142894633/3a8c246a-df46-4e3c-848a-f8730ac58766)

# 节点配置如下
![image](https://github.com/eoovve/Huggingface-ws/assets/142894633/b97638ec-1f71-4859-89fd-1a21744e49ca)

可以利用cf的workers套cdn加速配合优选ip或优选域名使用，反代代码如下，替换第6行中的地址。
```
export default {
    async fetch(request, env) {
        let url = new URL(request.url);
        if (url.pathname.startsWith('/')) {
            var arrStr = [
                'aaaa.bbbbb.hf.space',
            ];
            url.protocol = 'https:'
            url.hostname = getRandomArray(arrStr)
            let new_request = new Request(url, request);
            return fetch(new_request);
        }
        return env.ASSETS.fetch(request);
    },
};
function getRandomArray(array) {
  const randomIndex = Math.floor(Math.random() * array.length);
  return array[randomIndex];
}
```
