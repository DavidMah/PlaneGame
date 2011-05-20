package {
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import flash.text.TextField;

	public class Score extends Sprite {
		public var score:Number;
		public var scoreMessage:TextField;
		public function Score(x:Number, y:Number):void {
			score = 0;
			this.x = x;
			this.y = y;

			graphics.beginFill(0xffffff);
			graphics.drawRect(0, 0, 400, 800);
			graphics.endFill();


			var format:TextFormat = new TextFormat();
			format.size = 25;

			scoreMessage = new TextField();
			scoreMessage.x = 25;
			scoreMessage.y = 25;
			scoreMessage.width = 200;
			scoreMessage.height = 50;
			scoreMessage.defaultTextFormat = format;
			scoreMessage.text = "Score: 0";
			addChild(scoreMessage);
		}
		public function update(increment:Number):void {
			score += increment;
			scoreMessage.text = "Score: " + score;
		}

	}
}
