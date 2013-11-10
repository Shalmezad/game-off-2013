package  
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		
		[Embed(source = "../res/player-reg.png")] 			
		private const G_PLAYER:Class;
		
		public function Player() 
		{
			loadGraphic(G_PLAYER, false,true);
			acceleration.y = 300;
			y = 150;
		}
		
		
		override public function update():void
		{
			super.update();
			if (Key.LEFT && !Key.RIGHT) 
			{
				x--;
				facing = FlxObject.LEFT;
			}
			else if (Key.RIGHT && !Key.LEFT) 
			{
				x++;
				facing = FlxObject.RIGHT;
			}
			
			if (Key.JUMP && isTouching(FLOOR)) 
			{
				velocity.y = -200;
			}
		}
	}

}