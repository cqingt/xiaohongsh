const serviceUrl = 'http://app.cidianpu.com/apps/'; //主域名

const servicePath = {
  'homePage' : serviceUrl + 'home/index', // 主页
  'loginPage' : serviceUrl + 'login/index', // 登录
  'logoutPage': serviceUrl + 'login/logout', // 退出
  'registerPage': serviceUrl + 'register/index', // 注册
  'searchPage': serviceUrl + 'note/search', //搜索

  'sendSms' : serviceUrl + 'util/sendSms', // 发送短信接口
  'noteDetail' : serviceUrl + 'note/detail', // 笔记详情页
  'noteComments' : serviceUrl + 'note/comments', // 笔记评论
  'noteRecommend' : serviceUrl + 'note/recommends', //推荐
  'noteFavorite' : serviceUrl + 'note/favorite', // 笔记收藏与取消
  'noteLikes' : serviceUrl + 'note/likes', //笔记点赞与取消
  'noteComment': serviceUrl + 'note/comment', //发表留言
  //'cancelFavorite' : serviceUrl + 'note/cancelFavorite', //取消收藏
  //'cancelLikes' : serviceUrl + 'note/cancelLikes', //取消点赞
  'commentLikes' : serviceUrl + 'note/commentLikes', // 评论点赞 与 取消点赞

  'userCenter': serviceUrl + 'user/info', // 用户信息
  'userEdit': serviceUrl + 'user/edit', //用户编辑信息
  'userAttention' : serviceUrl + 'user/attention', // 关注用户
  'cancelAttention' : serviceUrl + 'user/cancelAttention', // 取消关注
  'uploadAvatar': serviceUrl + 'user/uploadAvatar', //上传头像
  'userNotes' : serviceUrl + 'user/notes', //用户笔记列表
  'userFavorites' : serviceUrl + 'user/favorites', //用户收藏列表
  'userAttentions' : serviceUrl + 'user/attentions', //用户关注列表
  'userFans' : serviceUrl + 'user/fans', //用户粉丝列表
  'createNote' : serviceUrl + 'note/create', //添加笔记
  'uploadImage': serviceUrl + 'note/uploadImage', //上传图片
};