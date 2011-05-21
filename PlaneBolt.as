package {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import com.junkbyte.console.Cc;

	public class PlaneBolt extends Projectile {
		private static var imageFile:URLRequest = new URLRequest("http://www.davidpmah.com/planegame/images/planebolt.png");
		public static function initializeClass():void { 
			imageFile.cacheResponse = true;
		}
		public function PlaneBolt(x:Number, y:Number):void {
			super(x, y);
			loadSprite();
			graphics.lineStyle(2, 0xFF0000);
			graphics.drawCircle(0, 0, 4);
			graphics.endFill();
		}
		override public function move():void {
			this.y = this.y - 20;
		}
		override public function getType():String{return "PlaneBolt";}
		override public function radius():Number{return 4;}
		override public function image():URLRequest{return imageFile;}
	}
}
