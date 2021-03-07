const fs = require('fs')
const conf = require('./conf.js')
const path = require('path')
const readline = require('readline')
const execSync = require('child_process').execSync;



let thead = '', tbody = ''
const keys = ['path', 'desc']

async function run() {

	keys.forEach( k => thead += `<td>${k}</td>`)


	for (let i = 0; i < conf.length; i++ ) {
		const c = conf[i]


		try {


			const txt = await ( await fs.readFileSync( c.path ) ).toString()

			const p = '.' + c.path
			await fs.mkdirSync( path.dirname(p), { recursive: true });
			await fs.writeFileSync( p, txt )
			console.log(`saved: ${c.path}`)

			const a = (k,l) => (k == 'path') ? `<${l}code>` : ''
			tbody += '<tr>'
			keys.forEach( k => tbody += `<td>${a(k,'')}${c[k]}${a(k,'/')}</td>`)
			tbody += '/<tr>\n\t\t'

		} catch(err) {
			throw err
		}
	}

	const html = `
\`\`\`
${ await execSync( 'uname -a ') }
${ await execSync( 'lsb_release -a') }
Last updated: ${ (new Date()).toDateString() }
\`\`\`


<table>
	<thead>
		<tr>${thead}</tr>
	</thead>
	${tbody}
</table>
	`

	fs.writeFileSync( 'README.md', html )

}

run()