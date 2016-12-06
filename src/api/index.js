import { Router } from 'express';
export default ({sequelize}) => {
  let api = Router();
  var user = require('./UserAPIController')(sequelize);
  var category = require('./CategoryAPIController')(sequelize);
  var post = require('./PostAPIController')(sequelize);
  api.get('/:uid/top',user.homePageDataTop);
  api.get('/:uid/new',user.homePageDataNew);
  api.get('/category/new/:category',category.getNewPosts);
  api.get('/category/top/:category',category.getTopPosts);
  api.post('/fileUpload',post.newPost);
  return api;
}
