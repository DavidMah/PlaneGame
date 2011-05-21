package {
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import com.junkbyte.console.Cc;
	
	public class EvilOne extends Ship {
		private static var imageFile:URLRequest = new URLRequest("http://www.davidpmah.com/planegame/images/evilone.png");
		public function EvilOne(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
			xVelocity = Math.random() * 10 - 5;
			yVelocity = Math.random() * 10;
			graphics.lineStyle(1, 0x000000);
			graphics.beginFill(0x0000dd);
			graphics.drawRect(-20, -20, 40, 40);
			loadSprite();
		}
		override public function act(index:int):Array {
			var sendbacks:Array = super.act(index);
			if(Math.random() * 30 < 1) {
				sendbacks.push( (new Signal()).setFloater(this.fire()).setIndex(index));
			}
			this.move();
			return sendbacks;
		}
		private function fire():Projectile{
			var bolt:EnemyBoltOne = new EnemyBoltOne(this.x, this.y - 10);
			if(this.y < player.y && Math.random() * 2 < 1) {
				bolt.affectVelocity(getRatio());
			}
			return bolt;
		}
		override public function move():void {
			this.x = this.x + xVelocity;
			this.y = this.y + yVelocity;
		}
		override public function getType():String{
			return "EvilOne";
		}
		override public function radius():Number{return 30;}
		override public function image():URLRequest{return imageFile;};
	}
}
