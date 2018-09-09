module.exports = {
    apps : [{
      name: "blog",
      script: "./public/",
      env_production: {
        NODE_ENV: "production",
      },
      env: {
        PM2_SERVE_PATH: ".",
        PM2_SERVE_PORT: 8001,
      }
    }]
  }
