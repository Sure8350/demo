# demo
===========================
利用Springmvc+mybatic+mysql+eclipse做了一个简单的商城购物demo，适合新手训练。
运行demo.sql，并且更改配置中的数据库地址，图片存储在F盘，没有F盘的话就在GoodsController中更改
实现功能有以下:
1.登录
请求过滤，未登录成功只允许访问登录和注册页面
检测登录用户信息状态: a.用户名不存在b.用户密码错误，请重新输入
登录成功用户信息存在session中，可以跨页面免过滤
2.注册
检测注册用户信息状态: a.注册信息有空缺b.用户名已经存在c.输入密码不一致d.注册成功
注册用户权限是游客
3.退出
清空sessiond的登录信息
4.权限
两个权限1.管理员2.游客 
访问不同功能模块，反应在主页左侧功能栏不同
![](https://github.com/Sure8350/demo/raw/master/login.gif)
===========================
5.管理展示商品
下拉框获取后台mysql的信息显示，
刷新页面重新获取商品信息展示
上传图片，存储在F:/upload_goods/XXX指定目录和名字，mysql信息也刷新
存储在本地磁盘，其他功能模块用到图片也在这里取出来，
这点我设计的有问题，之后想办法改掉
![](https://github.com/Sure8350/demo/raw/master/manage.gif)
===========================
6.选择商品添加到购物车
添加相同商品，数量合并，超出库存添加失败
7.结算
8.查询历史订单
![](https://github.com/Sure8350/demo/raw/master/pay.gif)
===========================

# 问题
后续有时间再补充一些功能
1.修改更新商品
2.结算跳转付款页面
3.删除修改当前订单中商品的数量
