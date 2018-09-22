function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	myVarName: 'someValue',
    baseUrl: 'http://localhost:3005/',
    aboutUrl: 'http://localhost:3005/about',
    userUrl: 'http://localhost:3005/api/user/',
    tripUrl: 'http://localhost:3005/api/trip/',
    catchUrl: 'http://localhost:3005/api/catch/',
    statUrl: 'http://localhost:3005/api/stat/'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}