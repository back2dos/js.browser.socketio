package js.browser;

import haxe.Constraints.Function;

typedef Event<T> = String;

@:native("io")
extern class SocketIo {

  public static function connect(?url : String, ?opts : ManagerOpts) : Socket;
  public static var version : String;
  public static var protocol : Int;
  public static var transports : Array<Dynamic>;

// all above functions are nodejs only (dunno if there's a define for that):
  public static function Socket() : Void;
  //public static function Manager(url: String, ?opts: ManagerOpts) : Manager;
  public static function Emitter(): Void;
/*
     * Expose Transport
     * @api public
    io.Transport = require('./transport').Transport;

     * Expose all transports
     * @api public
    io.Transport.XHR = require('./transports/xhr').XHR;
*/
}

extern class Socket implements Dynamic extends js.browser.socketio.EventEmitter<Socket> {
  public static function Socket(options : Dynamic) : Void;

  public var connected : Bool;
  public var open : Bool;
  public var connecting : Bool;
  public var reconnecting : Bool;
  public var namespaces : Dynamic;
  public var buffer : Array<Dynamic>;
  public var doBuffer : Bool;


  //public function of(name : String) : Namespace;
  public function connect(?fn : Void -> Void) : Socket;
  public function packet(data : Dynamic) : Socket;
  public function disconnect() : Socket;

}

/*extern
class Flag {
  public function send() : Void;
  public function emit() : Void;
}*/

typedef ManagerOpts = {
  ?multiplex: Bool,
  ?reconnection: Bool,
  ?reconnectionDelay: Int,
  ?reconnectionDelayMax: Int,
  ?timeout: Int,
  ?transports: Array<String>
}

@:enum abstract SocketEvent<T:Function>(String) to js.browser.socketio.EventEmitter.Event<T> {

  /**
     * Fired upon a connection including a successful reconnection.
     * socket.on('connect', () => {
     *   // ...
     * });
     *
     * // note: you should register event handlers outside of connect,
     * // so they are not registered again on reconnection
     * socket.on('myevent', () => {
     *   // ...
     * });
     */
  var Connect:SocketEvent<Void->Void> = "connect";

  /**
    * Fired upon a connection error.
    *
    * @param error (Object) error object
    */
  var ConnectError:SocketEvent<SocketError->Void> = "connect_error";

  /**
    * Fired upon a connection timeout.
    *
    * @param timeout (Object) timeout???
    */
  var ConnectTimeout:SocketEvent<Dynamic->Void> = "connect_timeout";

  /**
    * Fired when an error occurs.
    *
    * @param error (Object) error object
    */
  var Error:SocketEvent<SocketError->Void> = "error";

  /**
    * Fired upon a disconnection.
    *
    * @param reason (String) either 'io server disconnect' or 'io client disconnect'
    */
  var Disconnect:SocketEvent<String->Void> = "disconnect";

  /**
    * Fired upon a successful reconnection.
    *
    * @param attempt (Number) reconnection attempt number
    */
  var Reconnect:SocketEvent<UInt->Void> = "reconnect";

  /**
    * Fred upon an attempt to reconnect.
    *
    * @param attempt (Number) reconnection attempt number
    */
  var ReconnectAttempt:SocketEvent<UInt->Void> = "reconnect_attempt";

  /**
    * Fired upon an attempt to reconnect..
    *
    * @param attempt (Number) reconnection attempt number
    */
  var Reconnecting:SocketEvent<UInt->Void> = "reconnecting";

  /**
    * Fired upon a reconnection attempt error.
    *
    * @param error (Object) error object
    */
  var ReconnectError:SocketEvent<SocketError->Void> = "reconnect_error";

  /**
    * Fired when couldn't reconnect within reconnectionAttempts.
    */
  var ReconnectFailed:SocketEvent<Void->Void> = "reconnect_failed";

  /**
    * Fired when a ping packet is written out to the server.
    */
  var Ping:SocketEvent<Void->Void> = "ping";

  /**
    * Fired when couldn't reconnect within reconnectionAttempts.
    *
    * @param latency (Number) number of ms elapsed since ping packet (i.e.: latency).
    */
  var Pong:SocketEvent<UInt->Void> = "pong";
}

typedef SocketError = Dynamic;