import { Router } from 'express';
// import hardware from './hardware.js';
module.exports = function (sequelize) {
  let api = Router();
  // TODO: access control
  
  // api.get('/hardware/',hardware.findAll);
  // api.get('/hardware/checkedout',hardware.findCheckedOut);

  return api;
}
