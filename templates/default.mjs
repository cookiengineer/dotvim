
const update_menu = (menu) => {

	menu.forEach((item) => {

		let href = item.getAttribute('href');
		if (href !== null && window.location.href.endsWith(href) === true) {
			item.className = 'active';
		} else {
			item.className = '';
		}

	});

};

window.addEventListener('DOMContentLoaded', () => {

	let aside = window.document.querySelector('aside');
	if (aside !== null) {

		let menu = Array.from(aside.querySelectorAll('a')).slice(1);
		if (menu.length > 0) {

			update_menu(menu);

			menu.forEach((item) => {

				item.addEventListener('mouseenter', () => {
					menu.forEach((item) => item.className = '');
				});

				item.addEventListener('mouseleave', () => {
					update_menu(menu);
				});

			});

		}

	}

	let header = window.document.querySelector('header');
	if (header !== null) {

		header.style['padding-top']    = '0px';
		header.style['padding-bottom'] = '0px';

		setTimeout(() => {

			let box = header.getBoundingClientRect();
			let padding = (window.innerHeight - box.height) / 2;
			if (padding > 256) {
				header.style['padding-top']    = padding + 'px';
				header.style['padding-bottom'] = padding + 'px';
			} else {
				header.style['padding-top']    = null;
				header.style['padding-bottom'] = null;
			}

		}, 100);

	}

});

