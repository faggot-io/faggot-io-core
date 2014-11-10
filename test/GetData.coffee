Log = (require '..').Log
os = require 'os'
path = require 'path'

exports.GetData =
	'default': (test) ->
		item = new Log
		test.deepEqual item.GetData(), []
		test.done()

	'text log': (test) ->
		item = new Log
			text: 'testing'
			time: 12345678

		test.deepEqual item.GetData(), [
			'+log'
			12345678
			os.hostname()
			'logsack-core'
			'testing'
		]
		test.done()