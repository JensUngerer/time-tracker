CALL cd .. && CALL cd client && CALL npm run build && CALL cd .. && CALL cd serverNew && CALL npm run build:ci && CALL cd .. && CALL node .\serverNew\dist\time-tracker-server.js