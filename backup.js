const fs = require('fs')
const conf = require('./conf.js')
const path = require('path')
const readline = require('readline')

async function run() {


	for (let i = 0; i < conf.length; i++ ) {
		const c = conf[i]


		try {


			const txt = await ( await fs.readFileSync( c.path ) ).toString()

			const p = '.' + c.path
			await fs.mkdirSync( path.dirname(p), { recursive: true });
			await fs.writeFileSync( p, txt )
			console.log(`saved: ${c.path}`)

		} catch(err) {
			throw err
		}
	}

}

run()