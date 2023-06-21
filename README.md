# Introduction 
AWS Glue official container starter script with simple options. It will start a local container with AWSGLUE library, +Spark, +Livy

# Getting Started
Execute script `./start.sh`. It will start the container and the proper browser.

Alternativaly you can execute `make install` to create a `glue_local` command to run from any desired directory and then being attached to the container.

It accepts [1, 2, 3, 4] as options in order to choose the appropriate Glue version default is 4