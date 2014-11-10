Log = (require '..').Log
os = require 'os'
path = require 'path'

exports.toString =
	'default': (test) ->
		item = new Log
		test.strictEqual String(item), ''
		test.done()

	'text log': (test) ->
		item = new Log
			text: 'testing'
			time: 12345678
		test.strictEqual String(item), "+log|12345678|#{os.hostname()}|logsack-core|testing"
		test.done()
