###*
	@module Logsack
	@author muchweb
###

'use strict'

os = require 'os'
path = require 'path'

exports.Log = class

	###*
		Log outer part separator
		@property glue
		@type String
		@default '|'
	###
	@glue: '|'

	###*
		Log inner part separator
		@property lister
		@type String
		@default ','
	###
	@lister: ','

	###*
		Log node
		@property node
		@type Object
		@default os.hostname()
	###
	node: null

	###*
		Log stream
		@property stream
		@type Object
		@default null
	###
	stream: null

	###*
		Log time
		@property time
		@type Object
		@default Date.now()
	###
	time: null

	###*
		Log status
		@property status
		@type Object
		@default null
	###
	status: null

	###*
		Is textual log (not a system message)
		@property is_text
		@type Boolean
		@default false
	###
	is_text: false

	###*
		Contents of the log
		@property is_text
		@type String
		@default null
	###
	text: null

	###*
		@class Log
		@extends events.EventEmitter
		@param {[Object]} options Log default options
	###
	constructor: (options = {}) ->
		@time = Date.now()
		@node = os.hostname()
		@stream = process
			.cwd()
			.split path.sep
			.pop()

		# Apply all options
		@[key] = val for key, val of options

		@SetText options.text if options.text?
		@SetStream options.stream if options.stream?

	###*
		Set status
		@method SetStatusFromText
	###
	SetStatusFromText: (@status) ->
		text_exploded = @text.split exports.Log.glue
		@status = null
		@status = text_exploded.shift() if text_exploded.length > 0

	###*
		Set stream
		@method SetStream
	###
	SetStream: (@stream='') ->
		@stream = @stream.join exports.Log.lister if typeof @stream is 'object'

	###*
		Set text
		@method SetText
	###
	SetText: (@text='') ->
		@text = @text.join exports.Log.glue if typeof @text is 'object'
		@SetStatusFromText()
		@is_text = @text isnt ''

	###*
		Get data
		@method GetData
	###
	GetData: ->
		if @is_text
			data = []
			data.push '+log'
			data.push @time
			data.push @node
			data.push @stream
			data = data.concat @text.split exports.Log.glue if @text isnt ''
			return data
		return []

	###*
		To string
		@method toString
	###
	toString: ->
		return @GetData().join exports.Log.glue
