#!/usr/local/bin/lycheejs-helper env:node

const _ROOT = '/opt/lycheejs';

require(_ROOT + '/libraries/lychee/build/node/core.js')(__dirname);
require(_ROOT + '/libraries/lychee/build/node/dist/index.js');



/*
 * INITIALIZATION
 */

(function(lychee, global) {

	lychee.inject(lychee.ENVIRONMENTS['/libraries/lychee/dist']);


	setTimeout(function() {

		const _Main = lychee.import('lychee.app.Main');
		const MAIN  = new _Main({
			renderer: null
		});

		MAIN.init();

	}.bind(this), 200);

})(lychee, typeof global !== 'undefined' ? global : this);

