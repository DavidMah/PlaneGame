package {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;

	public class Background extends Sprite {
		public var bg1:Loader = new Loader();
		public var bg2:Loader = new Loader();
		public var bg3:Loader = new Loader();
		public var bg4:Loader = new Loader();

		public var up:URLRequest = new URLRequest("images/grassup.png");
		public var down:URLRequest = new URLRequest("images/grassdown.png");

		public var loaded:int = 0;
		public function Background():void {
			this.x = 0;
			this.y = 0;
			bg1.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			bg2.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			bg3.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			bg4.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);


			bg1.load(up);
			bg2.load(down);
			bg3.load(up);
			bg4.load(down);
		}
		public function onLoaderComplete(e:Event):void {
			loaded += 1;
			if(loaded == 4) {
				addChild(bg1);
				addChild(bg2);
				addChild(bg3);
				addChild(bg4);
				bg1.y = 0;
				bg2.y = 545;
				bg3.y = 1090;
				bg4.y = 1635;
			}
		}
		public function scroll():void {
			bg1.y = (bg1.y + 710) % 1635 - 700;
			bg2.y = (bg2.y + 710) % 1635 - 700;
			bg3.y = (bg3.y + 710) % 1635 - 700;
			bg4.y = (bg4.y + 710) % 1635 - 700;
		}
	}
}
