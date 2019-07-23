CALL .\change_submodule_path_for_client.bat
CALL .\change_submodule_path_for_server.bat
CALL .\change_submodule_path_for_common.bat
CALL .\change_submodule_path_for_documentation.bat
git submodule sync
git submodule update --init --recursive --remote
PAUSE
