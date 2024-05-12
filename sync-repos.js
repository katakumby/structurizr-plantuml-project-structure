const YAML  = require('yaml');
const exec  = require('child_process');
const fs = require('fs');

const file = fs.readFileSync('./services.yml', 'utf8')
const services = YAML.parse(file)

for (const [key, value] of Object.entries(services)) {
  console.log(`${key}: ${value.repo}`);
  
  exec.exec(`git clone -n --depth=1 --filter=tree:0 ${value.repo} ./src/services/${key}` , (err, stdout, stderr) => {
    // handle err, stdout & stderr
    console.log([err, stdout, stderr]);
    exec.exec(`cd src/services/${key}/ && git sparse-checkout set --no-cone docs && git checkout`, (err, stdout, stderr) => {
      // handle err, stdout & stderr
      console.log([err, stdout, stderr]);

     });

  });
}
