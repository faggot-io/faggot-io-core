Log = (require '..').Log
os = require 'os'
path = require 'path'

exports.Constructing =
	'default node': (test) ->
		item = new Log
		test.strictEqual item.node, os.hostname()
		test.done()

	'default stream': (test) ->
		item = new Log
		test.strictEqual item.stream, 'logsack-core'
		test.done()

	'default time': (test) ->
		item = new Log
		test.ok (item.time - Date.now()) < 50
		test.done()

	'default status': (test) ->
		item = new Log
		test.strictEqual item.status, null
		test.done()

	'default is_text': (test) ->
		item = new Log
		test.strictEqual item.is_text, false
		test.done()

	'default text': (test) ->
		item = new Log
		test.strictEqual item.text, null
		test.done()

	'overridden node': (test) ->
		item = new Log
			node: 'testing'
		test.strictEqual item.node, 'testing'
		test.done()

	'overridden stream': (test) ->
		item = new Log
			stream: 'testing'
		test.strictEqual item.stream, 'testing'
		test.done()

	'overridden time': (test) ->
		item = new Log
			time: 123456789
		test.strictEqual item.time, 123456789
		test.done()

	'overridden status': (test) ->
		item = new Log
			status: 'error'
		test.strictEqual item.status, 'error'
		test.done()

	'overridden is_text': (test) ->
		item = new Log
			is_text: true
		test.strictEqual item.is_text, true
		test.done()

	'overridden text': (test) ->
		item = new Log
			text: 'testing'
		test.strictEqual item.text, 'testing'
		test.done()

	'custom property': (test) ->
		item = new Log
			testing: 'testing'
		test.strictEqual item.testing, 'testing'
		test.done()

	'undefined property': (test) ->
		item = new Log
		test.strictEqual typeof item.testing, 'undefined'
		test.done()
