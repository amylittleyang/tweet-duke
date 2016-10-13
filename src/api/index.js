import { Router } from 'express';
export default ({sequelize}) => {
  let api = Router();
  var user = require('./UserAPIController')(sequelize);
  // TODO: access control
  
  api.get('/:uid',user.homePageData);

  return api;
}
