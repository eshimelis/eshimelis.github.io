'use strict';

var GetIntrinsic = require('get-intrinsic');

var $String = GetIntrinsic('%String%');

// https://262.ecma-international.org/5.1/#sec-9.8

module.exports = function ToString(value) {
	return $String(value);
};

