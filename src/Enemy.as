package  
{
	import org.flixel.FlxSprite;
	public class Enemy extends FlxSprite
	{
		
		public function Enemy() 
		{
			loadGraphic(Assets.G_BLACK_SHEEP);
			x = Main.GAME_WIDTH / 2;
			y = Main.GAME_HEIGHT / 2;
		}
		
		override public function update():void
		{
			super.update();
			angle = Math.atan2(Registry.player.y - y, Registry.player.x - x) * 180 / Math.PI;
		}
		
	}

}