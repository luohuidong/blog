module.exports = {
    apps : [{
      name: "blog",
      script: "serve",
      env: {
        PM2_SERVE_PATH: "./public",
        PM2_SERVE_PORT: 8001,
      }
    }]
  }
