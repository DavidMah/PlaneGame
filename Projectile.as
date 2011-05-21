package {
	import flash.display.Sprite;
	import com.junkbyte.console.Cc;

	public class Projectile extends Floater {
		public function Projectile(x:Number, y:Number):void{
			this.x = x;
			this.y = y;
		}
		public function affectVelocity(components:Array):void {
			var magnitude:Number = Math.sqrt(xVelocity * xVelocity + yVelocity * yVelocity);
			xVelocity = magnitude * components[0];
			yVelocity = magnitude * components[1];
		}
		override public function act(index:int):Array {
			var sendbacks:Array = super.act(index);
			this.move();
			return sendbacks;
		}
		override public function move():void {
			this.y = this.y - 15;
		}
		override public function getType():String{return "Projectile";}
	}
}
