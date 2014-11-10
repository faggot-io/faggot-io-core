Log = (require '..').Log
os = require 'os'
path = require 'path'

exports.SetStatusFromText =
	'same as text': (test) ->
		item = new Log
			text: 'testing'
		test.strictEqual item.text, 'testing'
		test.strictEqual item.status, 'testing'
		test.done()

	'from string': (test) ->
		item = new Log
			text: 'info|testing'
		test.strictEqual item.text, 'info|testing'
		test.strictEqual item.status, 'info'
		test.done()

	'from array': (test) ->
		item = new Log
			text: [
				'info'
				'testing'
			]
		test.strictEqual item.text, 'info|testing'
		test.strictEqual item.status, 'info'
		test.done()
