package js.browser.socketio;

import haxe.Constraints.Function;

#if hxnodejs

import js.node.EventEmitter as Emitter;


typedef Event<T:Function> = js.node.EventEmitter.Event<T>;
typedef EventEmitter<TSelf:Emitter<TSelf>> = Emitter<TSelf>;
#else
abstract Event<T:Function>(String) from String to String {}

@:jsRequire("events", "EventEmitter")
extern class EventEmitter<TSelf:EventEmitter<TSelf>> {
	function new();
	function addListener<T:Function>(event:Event<T>, listener:T):TSelf;
	function on<T:Function>(event:Event<T>, listener:T):TSelf;
	function prependListener<T:Function>(event:Event<T>, listener:T):TSelf;
	function prependOnceListener<T:Function>(event:Event<T>, listener:T):TSelf;
	function once<T:Function>(event:Event<T>, listener:T):TSelf;
	function removeListener<T:Function>(event:Event<T>, listener:T):TSelf;
	function removeAllListeners<T:Function>(?event:Event<T>):TSelf;
	function setMaxListeners(n:Int):Void;
	function getMaxListeners():Int;
	function listeners<T:Function>(event:Event<T>):Array<T>;
	function emit<T:Function>(event:Event<T>, args:haxe.extern.Rest<Dynamic>):Bool;
	function eventNames():Array<String>;
}
#end