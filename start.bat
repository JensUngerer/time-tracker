CALL cd client
CALL npm run build
CALL cd ..
CALL cd server
CALL npm run build
CALL cd ..
CALL node .\server\dist\index.js