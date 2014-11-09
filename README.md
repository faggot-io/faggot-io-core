# Logsack core [![Build Status](https://travis-ci.org/muchweb/logsack-core.svg)](https://travis-ci.org/muchweb/logsack-core) [![NPM version](https://badge.fury.io/js/logsack-core.svg)](http://badge.fury.io/js/logsack-core) ![License: GPLv3+](http://img.shields.io/badge/license-GPLv3%2B-brightgreen.svg)
=================================================

## Log class

### Properties

 - `node`: Represents current node (machine), default: hostname
 - `stream`: Represents worker or program name, default: name is working directory
 - `time`: Log time stamp
 - `status`: Log status: `info`, `warning`, etc…

```
item = new Log
```

## Credits

Based on [NarrativeScience/Log.io](https://github.com/NarrativeScience/Log.io). For list of contributors, please see [AUTHORS](AUTHORS).

## :free: License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.