package  {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import com.junkbyte.console.Cc;

	public class Floater extends Sprite {
		public var loader:Loader = new Loader();
		public var xVelocity:Number = 0;
		public var yVelocity:Number = 0;
		public function Floater():void {
		}
		public function loadSprite():void {
			if(image != null) {
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, setImage);
				loader.load(image());
			}
		}
		public function setImage(e:Event):void {
			addChild(loader);
			loader.x = loader.x - (loader.width / 2);
			loader.y = loader.y - (loader.height / 2);
			redraw();
		}
		public function getType():String {
			return "Floater";
		}
		public function act(index:int):Array {
			var sendbacks:Array = [];
			var boundCheck:Signal = checkBounds(index);
			if(boundCheck != null)
				sendbacks.push(boundCheck);
			return sendbacks;
		}
		public function move():void {}

		public function collision(other:Floater):Boolean {
			var distance:Number = Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2));
			var radii:Number = this.radius() + other.radius();
			var collided:Boolean = radii > distance;
			return collided;
		}
		public function checkBounds(index:int):Signal {
			var minX:Number = (50.0 * this.y / 400) - 50;
			minX = (minX < 0 ? minX : 0);
			var maxX:Number = 550 - (50.0 * this.y / 400);
			maxX = (maxX > 500 ? maxX : 500);
			if(this.x < minX || this.x > maxX)
				return (new Signal()).setDestroy(true, this).setIndex(index);
			return null;
		}
		public function translateType():int {
			var type:String = this.getType();
			if(type == "Plane")
				return 0;
			else if(type == "Ship" || type == "EvilOne" || type == "EvilTwo")
				return 1;
			else if(type == "PlaneBolt")
				return 2;
			else if(type == "EnemyBolt")
				return 3;
			return -1;
		}
		public function radius():Number{return 0;}
		public function image():URLRequest{return null;}
		public function redraw():void {return;}
	}
}
