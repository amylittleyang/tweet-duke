var fs = require('fs');
var fpath = __dirname + '/../../media/';
module.exports = function (sequelize) {

  function insertThing(tid,tname) {
    sequelize.query(
      "SELECT * FROM thing WHERE thing.tid='"+tid+"'"
    ,{type:sequelize.QueryTypes.SELECT})
    .then(function(data) {
      if(data.length===0) {
          sequelize.query(
            "INSERT INTO thing VALUES('"+tid+"','"+tname+"')"
          ,{type:sequelize.QueryTypes.INSERT});
      }
    })
  }

  function insertRating(tid,data,fname) {
    sequelize.query(
      "INSERT INTO ratings VALUES('"+data.uid+"',\
      '"+tid+"',\
      '"+data.rating+"',\
      '"+data.timestamp+"',\
      '"+fpath+fname+"'\
      )"
    ,{type: sequelize.QueryTypes.INSERT})
    .then(function success() {
      // console.log('executing rating success callback');
      // successCallback();
    }, function error(err) {
      // errorCallback(err);
      // res.status(500);
    });
  }

  function insertTags(tid,tags) {
    for (var tag of tags) {
      sequelize.query(" \
        SELECT tags.tag, tags.freq FROM tags WHERE tags.tag='"+tag+"' AND tid='"+tid+"' \
      ",{type:sequelize.QueryTypes.SELECT})
      .then(function success(res) {
        if(res.length==0) {
          // insert tag and set frequency to 1
          sequelize.query(" \
            INSERT INTO tags VALUES('"+tid+"','"+tag+"',1)\
          ",{type:sequelize.QueryTypes.INSERT});
        } else {
          // freq++
          sequelize.query(" \
            UPDATE tags SET freq="+(res[0].freq+1)+"\
            WHERE tag='"+tag+"' AND tid='"+tid+"' \
          ",{type:sequelize.QueryTypes.UPDATE});
        }
      });
    }
  }

  // add new post to db, upload media file
  function newPost(req,res,next) {
    var fstream;
    var data = Object();
    var fname = "";
    req.pipe(req.busboy);
    req.busboy.on('field', function(fieldname, val, fieldnameTruncated, valTruncated) {
      if (fieldname === 'rating') {
        data['rating'] = val;
      }
      if (fieldname === 'tags') {
        // console.log(typeof(val));
        var tags = val.split(",");
        data['tname'] = tags[0];
        tags.splice(0,1);
        data['tags'] = tags;
      }
      if (fieldname === 'timestamp') {
        data['timestamp'] = val;
      }
      if (fieldname === 'uid') {
        data['uid'] = val;
      }
    });

    req.busboy.on('file', function (fieldname, file, filename) {
        var filePath = fpath + filename;
        fname = filename;
        fstream = fs.createWriteStream(filePath);
        // console.log("write stream: "+__dirname + "/../../media/")
        file.pipe(fstream);
    });

    req.busboy.on('finish',function () {
      var tid = data.tname.replace(/\s+/g,'')
      var tname = data.tname;
      // insert into thing is not exist
      sequelize.query("SELECT * FROM thing WHERE name='"+data.tname+"'",{type:sequelize.QueryTypes.SELECT})
      .then(function(thing) {
        if(thing.length===0) {
          sequelize.query("INSERT INTO thing VALUES('"+tid+"','"+data.tname+"')",{type:sequelize.QueryTypes.INSERT})
          .then(function(){
            insertThing(tid,tname);
            insertRating(tid,data,fname,res);
            insertTags(tid,data.tags);
          });
        } else {
          insertThing(tid,tname);
          insertRating(tid,data,fname,res);
          insertTags(tid,data.tags);
        }
      });
      res.writeHead(303, { Connection: 'close', Location: '/' });
      res.end();
    });

  }
  return {newPost};
}
