package {
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	public class EvilTwo extends Ship {
		private static var imageFile:URLRequest = new URLRequest("http://www.davidpmah.com/planegame/images/eviltwo.png");
		public static function initializeClass():void {
	//		imageFile.setCacheResponse(true);
		}
		public function EvilTwo(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
			xVelocity = Math.random() * 5 - 2.5;
			yVelocity = Math.random() * 12;
			graphics.lineStyle(1, 0x000000);
			graphics.beginFill(0x00dd00);
			graphics.drawRect(-15, -15, 30, 30);
			loadSprite();
		}
		override public function act(index:int):Array {
			var sendbacks:Array = super.act(index);
			if(Math.random() * 20 < 1) {
				sendbacks.push( (new Signal()).setFloater(this.fire()).setIndex(index));
			}
			this.move();
			return sendbacks;
		}
		public function fire():Projectile {
			var bolt:EnemyBoltTwo = new EnemyBoltTwo(this.x, this.y + 16);
			if(this.y < player.y && Math.random() * 3 < 1) 
				bolt.affectVelocity(getRatio());
			return bolt;
		}
		override public function move():void {
			this.x = this.x + xVelocity;
			this.y = this.y + yVelocity;
		}
		override public function getType():String{
			return "EvilTwo";
		}
		override public function radius():Number{return 32;}
		override public function image():URLRequest{return imageFile;}
	}
}
