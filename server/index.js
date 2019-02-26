const fs = require('fs');
const path = require('path');

const Koa = require('koa');
const Router = require('koa-router');
const koaBody = require('koa-body');
const Mock = require('mockjs');

const app = new Koa();
const rootRouter = new Router();

const uuid = () => (Date.now() + Math.random()).toString().replace(/\./, '');

// http://mockjs.com/examples.html

rootRouter
  // 登陆
  .post('/api/login', ctx => {
    ctx.body = Mock.mock({
      data: {
        'id': uuid,
        'full_name': '@name',
        'age|18-30': 18,
        'sex|+1': ['男', '女'],
        'email': '@email',
        'address': '@county(true)',
        'jwt_token': '@string(60)',
      },
      err_code: '',
      err_msg: ''
    });
  })
  
  // 用户列表
  .get('/api/users', async ctx => {
    await new Promise((resolve, reject) => {
      setTimeout(() => {
        ctx.body =  Mock.mock({
          data: {
            'list|20': [
              {
                'id': uuid,
                'full_name': '@name',
                'age|18-30': 18,
                'sex|+1': ['男', '女'],
                'email': '@email',
                'address': '@county(true)'
              }
            ],
            page_index: 0,
            page_size: 20,
            total: 52
          },
          err_code: '',
          err_msg: ''
        });
        resolve();
      }, 1000);
    });
  })

  .get('/api/users/:userId', async ctx => {
    await new Promise((resolve, reject) => {
      setTimeout(() => {
        ctx.body =  Mock.mock({
          data: {
            'id': uuid,
            'full_name': '@name',
            'age|18-30': 18,
            'sex|+1': ['男', '女'],
            'email': '@email',
            'address': '@county(true)'
          },
          err_code: '',
          err_msg: ''
        });
        resolve();
      }, 1000);
    });
  })
  
  // 文件上传
  .post('/api/upload', koaBody({
    multipart: true,
    formidable: {
      maxFileSize: 200 * 1024 * 1024  // 设置上传文件大小最大限制，默认2M
    }
  }), async ctx => {
    await new Promise((resolve, reject) => {
      const file = ctx.request.files.file;
      const ext = file.name.split('.').pop();
      const fileName = uuid() + '.' + ext;
      const filePath = path.join(__dirname, `./upload/${fileName}`);

      const reader = fs.createReadStream(file.path);
      const writer = fs.createWriteStream(filePath);
      reader.pipe(writer);

      reader.on('end', () => {
        console.log('reader ended!');
      });

      writer.on('finish', () => {
        console.log('writer ended!');

        ctx.body = {
          data: null,
          err_code: '',
          err_msg: ''
        };

        resolve();
      });
    });
  })
  ;

app
  .use(rootRouter.routes())
  .listen(8888)
  ;