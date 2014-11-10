Log = (require '..').Log
os = require 'os'
path = require 'path'

exports.SetText =
	'adding text via constructor - string': (test) ->
		item = new Log
			text: 'testing'
		test.strictEqual item.text, 'testing'
		test.strictEqual item.is_text, true
		test.done()

	'adding text via function - string': (test) ->
		item = new Log
		item.SetText 'testing'
		test.strictEqual item.text, 'testing'
		test.strictEqual item.is_text, true
		test.done()

	'adding text via constructor - array': (test) ->
		item = new Log
			text: [
				'testing1'
				'testing2'
			]
		test.strictEqual item.text, 'testing1|testing2'
		test.strictEqual item.is_text, true
		test.done()

	'adding text via function - array': (test) ->
		item = new Log
		item.SetText [
			'testing1'
			'testing2'
		]
		test.strictEqual item.text, 'testing1|testing2'
		test.strictEqual item.is_text, true
		test.done()
