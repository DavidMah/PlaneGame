package {
	import flash.display.Sprite;
	import flash.net.URLRequest;

	public class EnemyBoltOne extends Projectile {
		private static var imageFile:URLRequest = new URLRequest("http://www.davidpmah.com/planegame/images/enemybolt1.png");
		public function EnemyBoltOne(x:Number, y:Number):void {
			super(x, y);
			xVelocity = Math.random() * 1.5 - 0.75;
			yVelocity = Math.random() * 1.5 - 0.75 + 5;
			graphics.lineStyle(2, 0xffffff);
			graphics.beginFill(0x0000ff);
			graphics.drawCircle(0, 0, 7);
			loadSprite();
		}
		override public function move():void {
			this.y = this.y + yVelocity;
			this.x = this.x + xVelocity;
		}
		override public function getType():String{return "EnemyBolt";}
		override public function radius():Number{return 8;}
		override public function image():URLRequest{return imageFile;}
	}
}
