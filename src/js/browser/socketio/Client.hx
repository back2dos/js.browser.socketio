package js.browser.socketio;

typedef ClientOptions = {
  @:optional var multiplex : Bool;
  @:optional var forceNew : Bool;
}

@:native("io")
extern
class Client 
extends EventEmitter<Client> {
  public function new(url : String, ?opts:ClientOptions ) : Void;
  public static var protocol(default,null) : String; 
}