assert = require 'assert'
starter = require '..'

describe 'starter', ->
  describe '#extend()', ->
    it 'should add all properties to destination object', ->
      # we are optimistic, non-empty `b` here should fail
      a =
        lala: 'lala'
      b =
      starter.extend a, b
      assert.deepEqual a, b
