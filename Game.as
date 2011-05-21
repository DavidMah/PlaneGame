package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	import com.junkbyte.console.Cc;

	[SWF(backgroundColor="#ffffff", width="800", height="800", frameRate="60")]
	public class Game extends Sprite {
		private var player:Plane;
		private var generator:EvilGenerator;
		private var playButton:PlayButton;
		private var scoreBoard:Score;
		private var background:Background;
		
		private var floaters:Array;
		private var playingGame:Boolean;
		public function Game():void {

	//		Cc.startOnStage(this, "'");
	//		Cc.visible = true;
	//		Cc.config.tracing = true;
	//		Cc.height = 800;
	//		Cc.x = 500;


			playingGame = false;
			playButton = new PlayButton(200, 250);
			addChild(playButton);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, playButton.highlight);
			stage.addEventListener(KeyboardEvent.KEY_UP, initializeGame);

			EvilTwo.initializeClass();
			PlaneBolt.initializeClass();
		}
		public function initializeGame(e:KeyboardEvent):void {
			if(e.keyCode != 90) {
				return;
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, reportKeyUp);

			removeChild(playButton);
			playingGame = true;

			background = new Background();
			addChild(background);

			floaters = []

			player = new Plane(250, 600);
			addChild(player);
			Ship.player = player;
			floaters.push([player]);
			floaters.push([], [], [], [])
			//player, enemy, planebolts, enemybolts
			
			var ship:Ship = new Ship();
			ship.initialize("EvilOne");
			addChild(ship);

			generator = new EvilGenerator();
			addChild(generator);

			graphics.lineStyle(2, 0x000000);
			graphics.drawRect(0, 0, 500, 800);

			scoreBoard = new Score(500, 0);

			addChild(scoreBoard);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
		}
		public function endGame():void {
			playingGame = false;
			for(var i:int = 0; i < floaters.length; i++) {
				for(var j:int = 0; j < floaters[i].length; j++) {
					removeChild(floaters[i][j]);
				}
			}
			scoreBoard.endGame(250, 250);
			removeChild(background);
		}
		private function onEnterFrame(e:Event):void {
			if(!playingGame) {
				return;
			}
			background.scroll();
			generateEnemies();
			var sendbacks:Array = [];
			for(var i:int = 0; i < floaters.length; i++) {
				for(var b:int = 0; b < floaters[i].length; b++) {
					var back:Array = floaters[i][b].act(b);
					sendbacks = sendbacks.concat(back);
				}
			}
		//	Cc.log(sendbacks);
			for(var j:int = sendbacks.length - 1; j >= 0; j--) {
				dealWithSignal(sendbacks[j]);
			}


			var result:Array = [[], []];
			//Ships colliding with projectiles
			for(i = 0; i < floaters[1].length; i++) {
				for(j = 0; j < floaters[2].length; j++) {
					result[0].push( (new Signal()).setDestroy(floaters[1][i].collision(floaters[2][j]), floaters[1][i]).setIndex(i));
				}
			}

			//Projectiles colliding with ships
			for(j = 0; j < floaters[2].length; j++) {
				for(i = 0; i < floaters[1].length; i++) {
					result[1].push( (new Signal()).setDestroy(floaters[2][j].collision(floaters[1][i]), floaters[2][j]).setIndex(j).setScore(1));
				}
			}

			//EnemyBolt Collision with player
			for(i = 0; i < floaters[3].length; i++) {
				if(floaters[3][i].collision(player)) {
					endGame();
				}
			}
			
			//Handle all signals
			for(i = result[0].length - 1; i >= 0; i--) {
				dealWithSignal(result[0][i]);
				dealWithSignal(result[1][i]);
			}

			addChild(scoreBoard);
		}	
		private function reportKeyDown(e:KeyboardEvent):void {
			var result:Floater = player.registerKey(e);
		}
		private function reportKeyUp(e:KeyboardEvent):void {
			var result:Floater = player.unregisterKey(e);
		}
		private function dealWithSignal(sendback:Signal):void {
			if(sendback.getSignal() == "Floater"){
				dealWithFloaterSignal(sendback.getFloater());
			}
			if(sendback.getSignal() == "Destroy"){
				dealWithDestroySignal(sendback);
			}
		}
		private function dealWithFloaterSignal(result:Floater):void {
			if(result != null) {
				if(result.getType() == "PlaneBolt") {
					floaters[2].push(result);
					addChild(result);
				} else if(result.getType() == "EnemyBolt") {
					floaters[3].push(result);
					addChild(result);
				}
			}
		}
		private function dealWithDestroySignal(signal:Signal):void {
			if(signal.getDestroy()) {
				if(contains(signal.getFloater())){
					removeChild(signal.getFloater());
					scoreBoard.update(signal.getScore());
					floaters[signal.getFloater().translateType()].splice(signal.getIndex(), 1);
				}
			}
		}
		private function generateEnemies():void {
			var result:Floater = generator.generate();
			if(result != null) {
				addChild(result);
				floaters[1].push(result);
			}
		}
	}
}
