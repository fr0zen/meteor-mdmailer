Package.describe({
  summary: "mdmailer allow you to send emails using Markdown."
});

Package._transitional_registerBuildPlugin({
  name: "compileMarkdown",
  use: ['coffeescript', 'marked'],
  sources: [
    'plugin/load-md.coffee'
  ],
  npmDependencies: {"marked": "0.3.2"}
});

Package.on_use(function (api, where) {
  api.use('coffeescript', 'server');
  api.use('email','server');
  api.add_files('mdmailer.coffee', 'server');
  api.export('mdmailer','server');
});

Package.on_test(function (api) {
  api.use('mdmailer');
  api.add_files('mdmailer_tests.coffee', ['server']);
});
