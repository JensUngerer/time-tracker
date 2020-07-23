// https://stackoverflow.com/questions/25574826/how-to-requiremodule-in-mongo-shell 

let module = {
    exports: {}
};

load('./../common/typescript/routes.js');

// DEBUGGING:
// print(JSON.stringify(routes, null, 4));
// print('-------')
// print(routes.databaseName);
// print('-----');

conn = new Mongo();
db = conn.getDB(routes.databaseName);

db.createCollection(routes.tasksCollectionName);

db.createCollection(routes.projectsCollectionName);

db.createCollection(routes.timEntriesCollectionName);

db.createCollection(routes.commitTimeRecordsCollectionName);

db.createCollection(routes.timeRecordsCollectionName);

db.createCollection(routes.bookingDeclarationsCollectionName);

db.logout();

conn.close();
