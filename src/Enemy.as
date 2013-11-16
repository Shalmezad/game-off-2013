package  
{
	import org.flixel.FlxSprite;
	public class Enemy extends FlxSprite
	{
		private const SPEED:int = 60;
		public static const TYPE_RANDOM:int = 0;
		public static const TYPE_WIZARD:int = 1;
		public static const TYPE_GOBLIN:int = 2;
		public static const TYPE_SHEEP:int = 3;
		
		private var enemyType:int;
		private var moveFunction:Function;
		private var changeColor:int = 0;
		private var coolDown:int = 0;
		
		public function Enemy() 
		{
			loadGraphic(Assets.G_BLACK_SHEEP);
			x = Main.GAME_WIDTH / 2;
			y = Main.GAME_HEIGHT / 2;
			moveFunction = cowardMove;
			maxVelocity.x = 80;
			maxVelocity.y = 80;
			start();
		}
		
		public function start(type:int = TYPE_RANDOM):void
		{
			switch(type)
			{
				case TYPE_RANDOM:
					change();
					break;
				case TYPE_WIZARD:
					toWizard();
					break;
				case TYPE_GOBLIN:
					toGoblin();
					break;
				case TYPE_SHEEP:
					toSheep();
					break;
			}
			this.exists = true;
			this.alive = true;
			var side:int = Math.random() * 4;
			if (side == 0) {
				//left
				this.x = -40;
				this.y = Math.random() * Main.GAME_HEIGHT;
			}
			else if (side == 1) {
				//top
				this.x = Math.random() * Main.GAME_WIDTH;
				this.y = -40;
			}
			else if (side == 2) {
				//right
				this.x = Main.GAME_WIDTH + 20;
				this.y = Math.random() * Main.GAME_HEIGHT;
			}
			else {
				//bottom
				this.x = Math.random() * Main.GAME_WIDTH;
				this.y = Main.GAME_HEIGHT + 20;
			}
		}
		
		override public function update():void
		{
			super.update();
			if (alive)
			{
				moveFunction();
				keepInBounds();
							
				changeColor+= 5;
				if (changeColor > 255)
					changeColor = 255;
				var intVal:int = changeColor << 16 | changeColor << 8 | changeColor;
				this.color = intVal;
				coolDown--;
				if (coolDown <= 0 && enemyType == TYPE_WIZARD) {
					Registry.enemyBullets.addBullet(	x, 
														y, 
														angle, 
														Assets.G_FIREBALL);
					coolDown = 30;
				}
			}
		}
		

		public function change():void
		{
			changeColor = 0;
			var changeShape:int = Math.random() * 3;
			if (changeShape == 0)
			{
				toSheep();
			}
			else if (changeShape == 1)
			{
				toWizard();
			}
			else 
			{
				toGoblin();
			}
		}
		
		public function toSheep():void
		{
			loadGraphic(Assets.G_BLACK_SHEEP);
			moveFunction = cowardMove;
			enemyType = TYPE_SHEEP;
		}
		public function toGoblin():void
		{
			loadGraphic(Assets.G_HOBGOBLIN);
			moveFunction = trackerMove;
			enemyType = TYPE_GOBLIN;
		}
		public function toWizard():void
		{
			loadGraphic(Assets.G_DARK_WIZARD);
			moveFunction = shooterMove;
			enemyType = TYPE_WIZARD;
		}
		
		private function trackerMove():void
		{
			//Go TOWARDS the player
			angle = Math.atan2(Registry.player.y - y, Registry.player.x - x) * 180 / Math.PI;
			velocity.x = SPEED * Math.cos(angle * Math.PI / 180.0);
			velocity.y = SPEED * Math.sin(angle * Math.PI / 180.0);
		}
		private function shooterMove():void
		{
			angle = Math.atan2(Registry.player.y - y, Registry.player.x - x) * 180 / Math.PI;
			acceleration.x = SPEED * Math.cos(angle * Math.PI / 180.0);
			acceleration.y = SPEED * Math.sin(angle * Math.PI / 180.0);
		}
		private function cowardMove():void
		{
			//Go AWAY from the player (face them, turn 180)
			angle = Math.atan2(Registry.player.y - y, Registry.player.x - x) * 180 / Math.PI + 180;
			velocity.x = SPEED * Math.cos(angle * Math.PI / 180.0);
			velocity.y = SPEED * Math.sin(angle * Math.PI / 180.0);
		}
		
		private function keepInBounds():void
		{
			if (x < 0) 
			{
				x = 0;
			}
			else if (x + width > Main.GAME_WIDTH) 
			{
				x = Main.GAME_WIDTH - width;
			}
			if (y < 0) 
			{
				y = 0;
			}
			else if (y + height > Main.GAME_HEIGHT) 
			{
				y = Main.GAME_HEIGHT - height;
			}
		}
	}

}