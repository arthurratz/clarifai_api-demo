var mysql   = require('mysql');
var express = require('express');
var clrfai  = require('clarifai');
var Jimp    = require('jimp');

var router = express.Router();

require('dotenv').config();

const app = new clrfai.App({
  apiKey: process.env.CLARIFAI_API_KEY
});

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Clarifi Image Classification API Demo v.1.0.0' });
});

router.post('/images', function(req, res, next) {
  var class_name = req.body["class_name"];
  var params = JSON.parse(
    require('fs').readFileSync('mysql.json'));
  var con_sql = mysql.createConnection(params);
  con_sql.connect((err) => {
    if (err) throw err;
    let query_classes = "SELECT image_url FROM clrfai_imagebase.concepts \
      WHERE class_name = \'" + class_name + "\'";
    con_sql.query(query_classes, (err, images) => {
        if (err) throw err;
        res.send(JSON.stringify(images));
    });
  });
});

router.post('/train', function(req, res, next) {
  var params = JSON.parse(
    require('fs').readFileSync('mysql.json'));
  var con_sql = mysql.createConnection(params);
  con_sql.connect((err) => {
    if (err) throw err;
    let query_classes = "SELECT class_id, class_name \
           FROM clrfai_imagebase.classes";
    con_sql.query(query_classes, (err, classes) => {
        if (err) throw err;
        classes.forEach(async (class_row, index) => {
            let class_id = class_row["class_id"],
                class_name = class_row["class_name"];
            let query_images = "SELECT * FROM clrfai_imagebase.images \
                WHERE class_id = \'" + class_id + "\'";
            await con_sql.query(query_images, async (err, images) => {
                if (err) throw err;
                var image_urls = images.map((image) => { return { url: image["image_url"], 
                      concepts: [ { id: class_name, value: true } ] }; });
                
                app.inputs.create(image_urls);

                await app.models.create(
                    "vehicles_class" + (index + 1),
                    [
                        { "id": class_name }
                    ]
                );

                app.models.train("vehicles_class" + (index + 1));
            });
        });
      });
  });
  
});

router.post('/predict', async function(req, res, next) {

  var params = JSON.parse(
    require('fs').readFileSync('mysql.json'));
  var con_sql = mysql.createConnection(params);
  await con_sql.connect((err) => {
    if (err) throw err;
    let query_classes = "SELECT * \
           FROM clrfai_imagebase.classes";
           
    Jimp.read(req.body["url"])
      .then(async (image_buf) => {
        await image_buf.grayscale().getBuffer(Jimp.AUTO, (err, data) => {
          if (err) throw err;
          con_sql.query(query_classes, async (err, classes) => {
            if (err) throw err;
            var predict_results = [];
            for (let index = 0; index < classes.length; index++) {
                 var buf = Buffer.from(data).toString('base64');
                 await app.models.predict({ id: "vehicles_class" + (index + 1), 
                    version: '' }, {'base64': buf}).then(
                    (response) => {
                      predict_results.push(response["outputs"][0]["data"]);
                    },
                    (err) => { console.log(err); }
                  );
            }
    
            var prob_max = Math.max.apply(Math, 
              predict_results.map((obj) => { return obj["concepts"][0]["value"]; }));
            predict_results = predict_results.filter((result) => 
              { return result["concepts"][0]["value"] == prob_max; });
    
            res.send(JSON.stringify({ "class": predict_results[0]["concepts"][0]["name"], 
                  "prob": predict_results[0]["concepts"][0]["value"]}));
          });
        })
     });          
   }); 
});

module.exports = router;
