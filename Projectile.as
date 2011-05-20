package {
	import flash.display.Sprite;
	import com.junkbyte.console.Cc;

	public class Projectile extends Floater {
		public function Projectile(x:Number, y:Number):void{
			this.x = x;
			this.y = y;
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
