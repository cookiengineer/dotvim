
lychee.define('app.Definition').requires([
	'lychee.event.Emitter'
]).includes([
	// TODO: includes
]).exports(function(lychee, global, attachments) {

	const _Emitter = lychee.import('lychee.event.Emitter');



	/*
	 * IMPLEMENTATION
	 */

	const Composite = function(data) {

		let states = Object.assign({}, data);


		this.property = null;


		this.setProperty(states.property);

		delete states.property;


		_Emitter.call(this, states);

		states = null;

	};


	Composite.prototype = {

		/*
		 * ENTITY API
		 */

		// deserialize: function(blob) { },

		serialize: function() {

			let data = _Emitter.prototype.serialize.call(this);
			data['constructor'] = 'app.Definition';

			let states = {};
			let blob   = (data['blob'] || {});


			if (this.property !== null) states.property = this.property;


			data['arguments'][0] = states;
			data['blob']         = Object.keys(blob).length > 0 ? blob : null;


			return data;

		},



		/*
		 * CUSTOM API
		 */

		setProperty: function(property) {

			property = property instanceof Object ? property : null;


			if (property !== null) {

				this.property = property;

				return true;

			}


			return false;

		}

	};


	return Composite;

});

