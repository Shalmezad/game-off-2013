package  
{
	import org.flixel.*;
	public class GameOverState extends FlxState
	{
		
		public function GameOverState(finalScore:int = 0) 
		{
			add(new FlxText(20, 20, 200, "GAME OVER"));
			add(new FlxText(20, 40, 200, "Final score: " + finalScore));
			add(new FlxButton(20, 80, "Continue", toMain));
		}
		private function toMain():void
		{
			FlxG.switchState(new MenuState());
		}
	}

}