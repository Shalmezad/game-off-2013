package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{

		
		public function GameState() 
		{			
			var branding:FlxText;
			branding = new FlxText(320 - 100, 5, 100, "Shalmezad");
			add(branding);
		}
		
		
		override public function update():void
		{
			super.update();
		}
	}

}