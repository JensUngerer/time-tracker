// https://stackoverflow.com/questions/25574826/how-to-requiremodule-in-mongo-shell 
var module = {};

load('./../common/typescript/routes.js');

// DEBUGGING:
// print(JSON.stringify(routes, null, 4));
// print('-------')
// print(routes.databaseName);
// print('-----');

conn = new Mongo();
db = conn.getDB(routes.databaseName);

db[routes.timeRecordsCollectionName].drop();

db[routes.projectsCollectionName].drop();

db[routes.timEntriesCollectionName].drop();

db[routes.tasksCollectionName].drop();

db[routes.bookingDeclarationsCollectionName].drop();

db.logout();

conn.close();
