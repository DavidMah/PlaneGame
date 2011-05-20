package {
	import flash.display.Sprite;

	public class EvilGenerator extends Sprite {
		private var length:Number;
		private var down:Number;
		public function EvilGenerator():void {
			length = 500;
			down = 200;
		}
		public function generate():Floater {
			var chance:int = Math.floor(Math.random() * 25);
			if(chance < 2) {
				var location:Number = Math.random() * (length + down * 2);

				var xLocation:Number = location - 200;
				xLocation = (location < 200 ? 0 : xLocation);
				xLocation = (location > 700 ? 500 : xLocation); 

				var yLocation:Number = 0;
				yLocation = (location < 200 ? location : yLocation);
				yLocation = (location > 700 ? location - 500 : yLocation);

				if(chance == 0)
					return new EvilOne(xLocation, yLocation);
				if(chance == 1)
					return new EvilTwo(xLocation, yLocation);
			}
			return null;
		}
	}
}
