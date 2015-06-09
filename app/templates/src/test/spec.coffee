assert = require 'assert'

<%= classname %> = require '..'

describe '<%= appname %>', ->
  describe '#extend()', ->
    it 'should add all properties to destination object', ->
      # we are optimistic, non-empty `b` here should fail
      a =
        lala: 'lala'
      b =
      <%= classname %>.extend a, b
      assert.deepEqual a, b
