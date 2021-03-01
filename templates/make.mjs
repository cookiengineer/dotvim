
import fs      from 'fs';
import path    from 'path';
import process from 'process';
import url     from 'url';



let   CACHE = null;
const FILE  = url.fileURLToPath(import.meta.url);
const NAME  = 'project';
const ROOT  = path.dirname(path.resolve(FILE, '../'));

const copy = (origin, target) => {

	let stat   = null;
	let result = false;

	try {
		stat = fs.statSync(path.resolve(origin));
	} catch (err) {
		stat = null;
	}

	if (stat !== null) {

		if (stat.isDirectory() === true) {

			let files = [];

			try {
				files = fs.readdirSync(path.resolve(origin));
			} catch (err) {
				files = [];
			}

			if (files.length > 0) {

				let results = files.map((file) => {
					return copy(origin + '/' + file, target + '/' + file);
				});

				if (results.includes(false) === false) {
					result = true;
				} else {
					result = false;
				}

			} else {
				result = true;
			}

		} else if (stat.isFile() === true) {

			stat = null;

			try {
				stat = fs.statSync(path.dirname(target));
			} catch (err) {
				stat = null;
			}

			if (stat === null || stat.isDirectory() === false) {

				try {
					fs.mkdirSync(path.dirname(target), {
						recursive: true
					});
				} catch (err) {
					// Ignore
				}

			}

			try {
				fs.copyFileSync(path.resolve(origin), path.resolve(target));
				result = true;
			} catch (err) {
				result = false;
			}

		}

	}

	if (result === true) {
		console.info(NAME + ': copy("' + origin.substr(ROOT.length + 1) + '", "' + target.substr(ROOT.length + 1) + '")');
	} else {
		console.error(NAME + ': copy("' + origin.substr(ROOT.length + 1) + '", "' + target.substr(ROOT.length + 1) + '")');
	}

	return result;

};

const remove = (url) => {

	let stat   = null;
	let result = false;

	try {
		stat = fs.statSync(path.resolve(url));
	} catch (err) {
		stat = null;
	}

	if (stat !== null) {

		if (stat.isDirectory() === true) {

			try {
				fs.rmdirSync(path.resolve(url), {
					recursive: true
				});
				result = true;
			} catch (err) {
				result = false;
			}

		} else if (stat.isFile() === true) {

			try {
				fs.unlinkSync(path.resolve(url));
				result = true;
			} catch (err) {
				result = false;
			}

		}

	}

	return result;

};



export const clean = () => {

	if (CACHE === false) {

		return true;

	} else {

		console.log(NAME + ': clean()');

		CACHE = false;

		let results = [
			true // Do something
		];

		if (results.includes(false) === false) {
			return true;
		}

	}


	return false;

};

export const build = () => {

	if (CACHE === true) {

		return true;

	} else {

		console.log(NAME + ': build()');

		let results = [
			true,
			copy(ROOT + '/something/else.mjs', ROOT + '/' + NAME + '/extern/something.mjs')
		];

		if (results.includes(false) === false) {
			CACHE = true;
			return true;
		}

	}


	return false;

};



let args = process.argv.slice(1);
if (args.includes(FILE) === true) {

	let results = [];

	if (args.includes('clean')) {
		CACHE = true;
		results.push(clean());
	}

	if (args.includes('build')) {
		results.push(build());
	}

	if (results.length === 0) {
		CACHE = true;
		results.push(clean());
		results.push(build());
	}


	if (results.includes(false) === false) {
		process.exit(0);
	} else {
		process.exit(1);
	}

}

