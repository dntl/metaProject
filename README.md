The META project
==============

How to use
-----------

* Copy files to the project folder (or add as a submodule).
* Add DebugTableViewController.h and DebugTableViewController.m to the project.
* Go to the project settings and select your main target.
* In the "Build Phases" section press "Add Build Phase" and choose "Add Run Script" (this new phase should be the last phase).
* Expand it and add "bash ${PROJECT_DIR}/path/to/metaproject/getDebugInfo.sh" (f.e. if you add metaproject as submodule to /submodules/metaproject it should be "bash ${PROJECT_DIR}/submodules/metaproject/getDebugInfo.sh")
* Initialise and show somewhere the DebugTableViewController view.
