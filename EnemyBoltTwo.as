package {
	import flash.display.Sprite;
	import flash.net.URLRequest;

	public class EnemyBoltTwo extends Projectile {
		private static var imageFile:URLRequest = new URLRequest("http://www.davidpmah.com/planegame/images/enemybolt2.png");
		public function EnemyBoltTwo(x:Number, y:Number):void {
			super(x, y);
			xVelocity = Math.random() * 2 - 1;
			yVelocity = Math.random() * 4 + 5;
			graphics.lineStyle(2, 0xffffff);
			graphics.beginFill(0x00ff00);
			graphics.drawCircle(0, 0, 5);
			this.rotation = 0;//Math.atan(yVelocity / xVelocity) * 180 / Math.PI;
			loadSprite();
		}
		override public function move():void {
			this.y = this.y + yVelocity;
			this.x = this.x + xVelocity;
		}
		override public function getType():String{return "EnemyBolt";}
		override public function radius():Number{return 6;}
		override public function image():URLRequest{return imageFile;}
	}
}
