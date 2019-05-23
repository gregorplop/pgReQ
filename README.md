# pgReQ
\
pgReQ is a LISTEN/NOTIFY-based request exchange mechanism for clients connecting to a PostgreSQL server.\
The name pgReQ is short for **postgres Request Queue**.\
\
pgReQ is a solution for developers who need to implement inter-process communication between applications connecting to the same postgres database.

pgReQ maintains three queues: 
* Incoming requests the client has accepted and has to process/respond to (until they expire)
* Requests the client has made to other clients and are awaiting response (until they expire)
* Responses to requests the client has made to other clients (and they came back with a reply)

pgReQ does not control or enforce program flow: It only **maintains** the queues. The rest is up to your application.\
For integrating pgReQ to your application you can either pick an event-based model or poll the queues at your own convenience.\
pgReQ can be used to implement both client-server and peer-to-peer communication.\


There is no extensive documentation on the classes. **Study the demo application**.\
It shows all you need to know for using the two pgReQ classes.

## Quick start guide for the demo application

The application will launch 2 types of windows: The controller and one or more consumer. Each window opens a separate session to the Postgres database.

1. Fill in host/port/database/username/password info on top of each window.
1. Click the "Connect" button. Watch the log (list on the right) for the outcome.
1. Connect both the controller and at least one consumer window.
1. On the consumer window, click "Send HASH request". This is an example request: The consumer generates a number and sends it to the controller. When the controller receives it, it calculates the MD5 hash of that number and sends it back to the client that made the request.
1. If you want to see requests timing out, restart the application and connect only the consumer to the database. Send requests and watch them timeout, since there is no controller to handle them.
1. The SHUTDOWN request is a signal the controller can send to the application. It is a request that does not require a response. It -unsurprisingly- shuts down the consumer.\

If you have any questions, drop me a line.
