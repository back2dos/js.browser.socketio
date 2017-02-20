package js.browser.socketio;

@:build(util.NativeMap.build())
abstract ClientOptions({
  @:optional var multiplex : Bool;

  @:native("force new connection")
  @:optional var forceNewConnection : Bool;
}){}

@:native("io")
extern
class Client 
extends EventEmitter<Client> {
  public function new(url : String, ?opts:ClientOptions ) : Void;
  public static var protocol(default,null) : String; 
}