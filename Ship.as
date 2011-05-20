package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.junkbyte.console.Cc;

	public class Ship extends Floater {
		private var health:int;
		public function initialize(type:String):void {
		}
		public function hurt(n:int):void {
			health = health - n;
		}
		public function getHealth():int {
			return health;
		}
	}
}
