package js.browser;

import haxe.Constraints.Function;

typedef Event<T> = String;

@:native("io")
extern
class SocketIo {

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

extern
class Socket implements Dynamic extends js.browser.socketio.EventEmitter<Socket> {
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