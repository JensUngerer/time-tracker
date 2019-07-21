// https://stackoverflow.com/questions/25574826/how-to-requiremodule-in-mongo-shell 

let module = {};

load('./common/typescript/routes.js');

conn = new Mongo();
db = conn.getDB(routes.databaseName);

db.createCollection(routes.tasksCollectionName);

db.createCollection(routes.projectsCollectionName);

db.createCollection(routes.timeRecordsCollectionName);

db.logout();

conn.close();
