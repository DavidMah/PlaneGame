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
		public function die():void {
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, setImage);
			loader.load(deathImage());
		}
		public function deathImage():URLRequest{ return new URLRequest("images/explosion.gif");}
	}
}
