Technical specifications
========================

 * A zombie listen ONE _server event_ connection.
 * Zombie can be a web browser or a script, implemented with sync or async technology.
 * Same purpose as XMMP : talking to someone behind a NAT.
 * No registered user, no auth. Just signed token with secret shared with the true master.
 * REST API
 * Token in the header, with and X-uid
 * No acl, root can do all thing, others can only read their own channel.
 * GET /lab/users/ connected users
 * POST /lab/user/toto send a message to _toto_
 * Server keep few messages for each users, when connecting, you get your old messages, then messages.
 * Messages format are unspecified, it CAN be Json
 * Web hook can be implemented to tell webapp when someone connects or leaves.
 * Websocket can be implemented, up message becomes web hook
 * Configuration is simple.
 * Nobody should know that Erlang is used.
 * No persistence. True men trust in RAM.
