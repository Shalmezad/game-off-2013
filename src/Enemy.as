package  
{
	import org.flixel.FlxSprite;
	public class Enemy extends FlxSprite
	{
		private const SPEED:int = 1;
		private var moveFunction:Function;
		private var changeColor:int = 0;
		
		public function Enemy() 
		{
			loadGraphic(Assets.G_BLACK_SHEEP);
			x = Main.GAME_WIDTH / 2;
			y = Main.GAME_HEIGHT / 2;
			moveFunction = cowardMove;
		}
		
		override public function update():void
		{
			super.update();
			moveFunction();
			keepInBounds();
						
			changeColor+= 5;
			if (changeColor > 255)
				changeColor = 255;
			var intVal:int = changeColor << 16 | changeColor << 8 | changeColor;
			this.color = intVal;
		}
		

		public function change():void
		{
			changeColor = 0;
			var changeShape:int = Math.random() * 2;
			if (changeShape == 1) 
			{
				toSheep();
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
		}
		public function toGoblin():void
		{
			loadGraphic(Assets.G_HOBGOBLIN);
			moveFunction = trackerMove;
		}
		
		private function trackerMove():void
		{
			//Go TOWARDS the player
			angle = Math.atan2(Registry.player.y - y, Registry.player.x - x) * 180 / Math.PI;
			x += SPEED * Math.cos(angle * Math.PI / 180.0);
			y += SPEED * Math.sin(angle * Math.PI / 180.0);
		}
		private function cowardMove():void
		{
			//Go AWAY from the player (face them, turn 180)
			angle = Math.atan2(Registry.player.y - y, Registry.player.x - x) * 180 / Math.PI + 180;
			x += SPEED * Math.cos(angle * Math.PI / 180.0);
			y += SPEED * Math.sin(angle * Math.PI / 180.0);
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