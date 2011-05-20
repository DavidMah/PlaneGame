package {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import com.junkbyte.console.Cc;

	public class PlaneBolt extends Projectile {
		public function PlaneBolt(x:Number, y:Number):void {
			super(x, y);
			graphics.lineStyle(2, 0xFF0000);
			//graphics.drawCircle(0, 0, 4);
			graphics.endFill();
			loadSprite();
		}
		override public function move():void {
			this.y = this.y - 15;
		}
		override public function getType():String{return "PlaneBolt";}
		override public function radius():Number{return 4;}
		override public function image():URLRequest{return new URLRequest("images/planebolt.png");}
	}
}
