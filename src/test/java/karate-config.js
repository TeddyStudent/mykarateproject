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
    statUrl: 'http://localhost:3005/api/stat/',
    test_user_fname: 'Teddy',
    test_user_lname: 'Student',
    test_user_ktun: 'TeddyStudent',
    test_user_pwd: 'teddypwd',
    new_user_fname: 'fname_test',
    new_user_lname: 'lname_test',
    new_user_uname: 'uname_test',
    new_user_pwd: 'pwd_test',
    known_user_id: 1,
    unknown_user_id: 11,
    modify_user_id: 2
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}