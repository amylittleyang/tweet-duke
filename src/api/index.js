import { Router } from 'express';
export default ({sequelize}) => {
  let api = Router();
  var user = require('./UserAPIController')(sequelize);

  api.get('/:uid',user.homePageData);
  
  return api;
}
