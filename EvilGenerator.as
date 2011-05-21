package {
	import flash.display.Sprite;

	public class EvilGenerator extends Sprite {
		private var length:Number;
		private var down:Number;
		private var chance:Number;
		private var training:Boolean = false;
		public function EvilGenerator():void {
			length = 500;
			down = 200;
			chance = 150;
		}
		public function generate():Floater {
			var chance:int = Math.floor(Math.random() * 150);
			if(chance < 20) {
				var location:Number = Math.random() * (length + down * 2);

				var xLocation:Number = location - 200;
				xLocation = (location < 200 ? -50 : xLocation);
				xLocation = (location > 700 ? 550 : xLocation); 

				var yLocation:Number = -50;
				yLocation = (location < 200 ? location : yLocation);
				yLocation = (location > 700 ? location - 500 : yLocation);

				if(chance <= 10)
					return new EvilOne(xLocation, yLocation);
				else if(chance <= 20)
					return new EvilTwo(xLocation, yLocation);
		//		else if(chance <= 21)
		//			train(xLocation, yLocation);
		//		else if(chance <= 22)
		//			train(xLocation, yLocation);
			} 
			chance = (chance > 50 ? .999 * chance : chance);
			return null;
		}
	}
}
