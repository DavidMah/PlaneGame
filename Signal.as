package {
	public class Signal {

		private var signal:String;

		private var string:String;
		private var floater:Floater;
		private var destroy:Boolean;
		private var score:int;
		public var index:int;

		public function Signal():void {
			signal = "null";
			score = 0;
		}
		public function getSignal():String{
			return signal;
		}
		public function setString(s:String):Signal {
			string = s;
			signal = "String";
			return this;
		}
		public function setFloater(f:Floater):Signal {
			floater = f;
			signal = "Floater";
			return this;
		}
		public function setDestroy(d:Boolean, f:Floater):Signal {
			floater = f;
			destroy = d;
			signal = "Destroy";
			return this;
		}
		public function setScore(i:int):Signal {
			score = i;
			return this;
		}
		public function setIndex(i:int):Signal {
			index = i;
			return this;
		}
		public function getString():String {
			return string;
		}
		public function getFloater():Floater {
			return floater;
		}
		public function getDestroy():Boolean {
			return destroy;
		}
		public function getScore():int {
			return score;
		}
		public function getIndex():int {
			return index;
		}
	}
}
