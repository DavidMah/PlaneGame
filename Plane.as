package {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.Event;

	import flash.events.KeyboardEvent;
	import com.junkbyte.console.Cc;

	public class Plane extends Ship{
		private var horizontal:Number;
		private var vertical:Number;

		private var firing:Boolean;
		private var reload:int;
		private var slow:Boolean;

		private var left:Boolean;
		private var right:Boolean;
		private var up:Boolean;
		private var down:Boolean;

		private var health:int;

		public function Plane(x:Number, y:Number):void {
			graphics.lineStyle(2, 0x000000);
			graphics.drawRect(-10, -10, 20, 20);
			graphics.lineStyle(2, 0xff0000);
			graphics.drawCircle(0, 0, 3);
			this.x = x;
			this.y = y;
			horizontal = 1;
			vertical = 1;

			firing = false;
			reload = 0;
			slow = false;

			left = false;
			right = false;
			up = false;
			down = false;
		}
		public function registerKey(e:KeyboardEvent):Floater {
			var result:Floater = null;
			if(e.keyCode == 37){
				Cc.log("left");
				left = true;
			}
			else if(e.keyCode == 39){
				Cc.log("right");
				right = true;
			}
			else if(e.keyCode == 38){
				Cc.log("up");
				up = true;
			}
			else if(e.keyCode == 40){
				Cc.log("down");
				down = true;
			}
			else if(e.keyCode == 90){
				firing = true;
			}
			else if(e.keyCode == 16){
				slow = true;
			}
			return result;

		}
		public function unregisterKey(e:KeyboardEvent):Floater {
			var result:Floater = null;
			if(e.keyCode == 37){
				left = false;
			}
			else if(e.keyCode == 39){
				right = false;
			}
			else if (e.keyCode == 38){
				up = false;
			}
			else if (e.keyCode == 40){
				down = false;
			}
			else if (e.keyCode == 90) {
				firing = false;
			}
			else if (e.keyCode == 16) {
				slow = false;
			}
			return result;
		}
		override public function act(index:int):Array {
			var sendbacks:Array = [];
			this.move();
			if(firing && reload <= 0) {
				var sendback:Signal = new Signal();
				sendback.setFloater(this.fire());
				sendback.setIndex(index);
				sendbacks.push(sendback);
				reload = 4;
			}
			reload -= 1
			return sendbacks;
		}
		override public function move():void {
			var f:Number = 5;
			var s:Number = 1.5;
			
			var xwise:Number = horizontal;
			var ywise:Number = vertical;

			if( (left && right) || (!left && !right)) {
				xwise = 0;
			} else if (left) {
				xwise = -xwise;
			}
			if( (down && up) || (!down && !up)) {
				ywise = 0;
			} else if (up) {
				ywise = -ywise;
			}

			if( !(this.x + radius() * 2 < 0 && xwise < 0) && !(this.x - radius() * 2 > 500 && xwise > 0)) {
				this.x = this.x + xwise * (slow ? s : f);
			}
			if( !(this.y < 0 && ywise < 0) && !(this.y > 800 && ywise > 0)) {
				this.y = this.y + ywise * (slow ? s : f);
			}
		}
		public function fire():Projectile {
			var bolt:PlaneBolt = new PlaneBolt(this.x , this.y - 15);
			return bolt;
		}
		override public function getType():String {
			return "Plane";
		}
		override public function hurt(n:int):void {
			
		}
		override public function radius():Number {return 3;}
	}
}
