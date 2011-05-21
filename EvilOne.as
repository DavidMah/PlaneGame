package {
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import com.junkbyte.console.Cc;
	
	public class EvilOne extends Ship {
		public var xVelocity:Number;
		public var yVelocity:Number;
		private static var imageFile:URLRequest = new URLRequest("http://www.davidpmah.com/planegame/images/evilone.png");
		public function EvilOne(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
			xVelocity = Math.random() * 4 - 2;
			yVelocity = Math.random() * 5;
			loadSprite();
		}
		override public function act(index:int):Array {
			var sendbacks:Array = super.act(index);
			if(Math.random() * 40 < 1) {
				sendbacks.push( (new Signal()).setFloater(this.fire()).setIndex(index));
				Cc.log("Derp");
			}
			this.move();
			return sendbacks;
		}
		private function fire():Projectile{
			var bolt:EnemyBolt = new EnemyBolt(this.x, this.y - 10);
			return bolt;
		}
		override public function move():void {
			this.x = this.x + xVelocity;
			this.y = this.y + yVelocity;
		}
		override public function getType():String{
			return "EvilOne";
		}
		override public function radius():Number{return 25;}
		override public function image():URLRequest{return imageFile;};
	}
}
