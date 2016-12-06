var fs = require('fs');

module.exports = function (sequelize) {
  function newPost(req,res,next) {
    var fstream;
    req.pipe(req.busboy);
    req.busboy.on('file', function (fieldname, file, filename) {
        // console.log("Uploading: " + filename);
        var filePath = __dirname + "/../../media/" + filename
        fstream = fs.createWriteStream(filePath);
        // console.log("write stream: "+__dirname + "/../../media/")
        file.pipe(fstream);
        fstream.on('close', function () {

          res.redirect('back');
        });
    });
  }
  return {newPost};
}
