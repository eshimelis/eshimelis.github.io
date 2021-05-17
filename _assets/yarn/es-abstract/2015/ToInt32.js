'use strict';

var ToNumber = require('./ToNumber');

// https://262.ecma-international.org/5.1/#sec-9.5

module.exports = function ToInt32(x) {
	return ToNumber(x) >> 0;
};
