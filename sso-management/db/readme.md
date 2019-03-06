```cmd
#start up
>mongod.exe

#log in
>mongo

#Switch database
>use admin

#Add administrator
>db.createUser({user: "admin",pwd: "123456",roles:[{role:"userAdminAnyDatabase", db: "admin" } ]})

#Switch database
>use cas-mongo-database

# New users
>db.createUser({user: "cas-config",pwd: "123456",roles: [ { role: "readWrite", db: "cas-mongo-database" }]})

# Restart and enable authentication
>mongod.exe --auth
```