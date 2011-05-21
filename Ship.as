package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.junkbyte.console.Cc;

	public class Ship extends Floater {
		private var health:int;
		public static var player:Ship;
		public function getRatio():Array {
			var changeX:Number = player.x - this.x;
			var changeY:Number = player.y - this.y;
			var magnitude:Number = Math.sqrt(changeY * changeY + changeX * changeX);
			changeY = changeY / magnitude;
			changeX = changeX / magnitude;
			var components:Array = new Array();
			components.push(changeX);
			components.push(changeY);
			return components;
		}
		public function initialize(type:String):void {
		}
		public function setVelocity(x:Number, y:Number):void {
			xVelocity = x;
			yVelocity = y;
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
