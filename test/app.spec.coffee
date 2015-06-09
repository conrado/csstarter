path = require 'path'
helpers = require('yeoman-generator').test

describe 'app', ->
  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'app.tmp'), (err) =>
      return done(err) if err
      @app = helpers.createGenerator 'csstarter:app', ['../../app']
      done()

  it 'creates expected files', (done) ->
    # add files you expect to expect to exist here.
    expected = """
      package.json
      README.md
      LICENSE
      .gitignore
      .npmignore
      gulpfile.coffee
      src/index.coffee
      src/test/test-module.spec.coffee
    """.split /\s+/g

    helpers.mockPrompt @app, someOption: true

    @app.options['skip-install'] = true

    @app.userInfo = ->
      @realname  = 'Conrado Buhrer';
      @email     = 'conrado@buhrer.net';
      @githubUrl = 'https://github.com/conrado'

    helpers.mockPrompt @app,
      githubUser: 'conrado'
      moduleName: 'test-module'

    @app.run {}, ->
      helpers.assertFile expected
      done()
