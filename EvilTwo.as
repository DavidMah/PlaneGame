package {
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	public class EvilTwo extends Ship {
		public var xVelocity:Number;
		public var yVelocity:Number;
		private static var imageFile:URLRequest = new URLRequest("http://www.davidpmah.com/planegame/images/eviltwo.png");
		public function EvilTwo(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
			xVelocity = Math.random() * 3 - 1.5;
			yVelocity = Math.random() * 3;
			loadSprite();
		}
		override public function act(index:int):Array {
			var sendbacks:Array = super.act(index);
			if(Math.random() * 60 < 1) {
				sendbacks.push( (new Signal()).setFloater(this.fire()).setIndex(index));
			}
			this.move();
			return sendbacks;
		}
		public function fire():Projectile {
			return new EnemyBolt(this.x, this.y + 16)
		}
		override public function move():void {
			this.x = this.x + xVelocity;
			this.y = this.y + yVelocity;
		}
		override public function getType():String{
			return "EvilTwo";
		}
		override public function radius():Number{return 17;}
		override public function image():URLRequest{return imageFile;}
	}
}
