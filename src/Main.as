package 
{
	import org.flixel.*;
	public class Main extends FlxGame 
	{
		public static const GAME_WIDTH:int = 320;
		public static const GAME_HEIGHT:int = 240;
		
		public static var DEV_CHEAT:Boolean = true;
		
		public function Main():void 
		{
			super(GAME_WIDTH, GAME_HEIGHT, GameState, 2, 60,30,true);
			FlxG.debug = true;
		}
		
	}
	
}