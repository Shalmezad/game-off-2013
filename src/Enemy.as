package  
{
	import org.flixel.FlxSprite;
	public class Enemy extends FlxSprite
	{
		private const SPEED:int = 1;
		
		public function Enemy() 
		{
			loadGraphic(Assets.G_BLACK_SHEEP);
			x = Main.GAME_WIDTH / 2;
			y = Main.GAME_HEIGHT / 2;
		}
		
		override public function update():void
		{
			super.update();
			trackerMove();
			keepInBounds();
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