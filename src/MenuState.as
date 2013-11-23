package  
{
	import org.flixel.*;
	public class MenuState extends FlxState
	{
		
		public function MenuState() 
		{
			add(new FlxText(10, 10, 200, "CHAOS SLOTS"));
			add(new FlxText(10, 30, 200, "By: Shalmezad"));
			add(new FlxButton(30, 50, "Start", startGame));
			add(new FlxButton(30, 70, "Instructions", instructions));
		}
		
		private function instructions():void
		{
			FlxG.switchState(new InstructionState(1));
		}
		
		private function startGame():void
		{
			FlxG.switchState(new GameState());
		}
		
	}

}