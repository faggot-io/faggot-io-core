Log = (require '..').Log
os = require 'os'
path = require 'path'

exports.SetStream =
	'adding stream via constructor - string': (test) ->
		item = new Log
			stream: 'testing'
		test.strictEqual item.stream, 'testing'
		test.done()

	'adding stream via constructor - array': (test) ->
		item = new Log
			stream: [
				'testing1'
				'testing2'
			]
		test.strictEqual item.stream, 'testing1,testing2'
		test.done()

	'adding stream via function - string': (test) ->
		item = new Log
		item.SetStream 'testing'
		test.strictEqual item.stream, 'testing'
		test.done()

	'adding stream via function - array': (test) ->
		item = new Log
		item.SetStream [
			'testing1'
			'testing2'
		]
		test.strictEqual item.stream, 'testing1,testing2'
		test.done()
