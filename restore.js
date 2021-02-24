const fs = require('fs')
const conf = require('./conf.js')
const path = require('path')
const readline = require('readline')
const readlineSync = require('readline-sync');
const diff = require('diff');
const colors = require('colors');


async function run() {


	for (let i = 0; i < conf.length; i++ ) {
		const c = conf[i]


		try {

			const src = await ( await fs.readFileSync( '.' + c.path ) ).toString()
			const dest = await ( await fs.readFileSync( c.path ) ).toString()
			const d = diff.diffChars(dest, src)
			const b = d.filter( s => s.added || s.removed ).length > 0
			if (b) {
				console.log('-----------------------------------------------------------')
				d.forEach( s => {
					if (s.added) console.log(s.value.brightGreen.bgBlack)
					if (s.removed) console.log(s.value.brightRed.bgBlack)
				})
				console.log('-----------------------------------------------------------')

				const oi = readlineSync.question('🚨  overwrite with these changes? (y/n): ')
				if (oi == 'y') {
					await fs.writeFileSync( c.path, src )
				}
			} else {
				console.log(`⏩  skipping identical: ${c.path}`)
			}

		} catch(err) {
			throw err
		}
	}

}

run()