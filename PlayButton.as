package {
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;

	public class PlayButton extends Sprite {
		public var initialX:Number;
		public var initialY:Number;

		public var instructions:TextField;
		public function PlayButton(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
			initialX = x;
			initialY = y;
			graphics.beginFill(0xff0000);
			graphics.drawRect(0, 0, 400, 50);
			graphics.endFill();

			var format:TextFormat = new TextFormat();
			format.size = 24;
			var text:TextField = new TextField();
			text.x = 25;
			text.y = 5;
			text.width = 400;
			text.height = 50;
			text.defaultTextFormat = format;
			text.text = "Click and Press Z to Play";

			instructions = new TextField();
			instructions.x = 75;
			instructions.y = 250;
			instructions.width = 400;
			instructions.height = 600;
			instructions.defaultTextFormat = format;
			instructions.text = "Z - Fire\nLeft - Left\nRight - Right\nUp - Up\nDown - Down\nShift - Slow\n\nYour hit box is the red dot";
			addChild(instructions);
			addChild(text);
		}
		public function highlight(e:KeyboardEvent):void {
			if(e.keyCode == 90){ 
				this.y = initialY + 5;
				instructions.y = 245;
			}
		}
		public function unlight(e:KeyboardEvent):void {
			this.x = initialX;
			this.y = initialY;
		}
	}
}
