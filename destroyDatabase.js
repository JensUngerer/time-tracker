// https://stackoverflow.com/questions/25574826/how-to-requiremodule-in-mongo-shell 
var module = {};

load('./common/typescript/routes.js');

conn = new Mongo();
db = conn.getDB(routes.databaseName);

db[routes.timeRecordsCollectionName].drop();

db[routes.projectsCollectionName].drop();

db[routes.timEntriesCollectionName].drop();

db[routes.tasksCollectionName].drop();

db.logout();

conn.close();
