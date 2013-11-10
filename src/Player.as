package  
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		
		[Embed(source = "../res/player-reg.png")] 			
		private const G_PLAYER_REG:Class;
		
		[Embed(source = "../res/player-turtle.png")] 			
		private const G_PLAYER_TURTLE:Class;
		
		private const STATE_REGULAR:int = 0;
		private const STATE_TURTLE:int = 1;
		private var currentState:int = 0;
		
		public function Player() 
		{
			loadGraphic(G_PLAYER_REG, false,true);
			acceleration.y = 300;
			y = 150;
		}
		
		public function changeState():void
		{
			//get the current centerX
			var cX:int = centerX;
			//and our current bottom.
			var btm:int = bottom;
			var nextClass:Class = null;
			currentState++;
			if (currentState > STATE_TURTLE) {
				currentState = STATE_REGULAR;
			}
			
			if (currentState == STATE_REGULAR) {
				nextClass = G_PLAYER_REG;
			}
			else if (currentState == STATE_TURTLE) {
				nextClass = G_PLAYER_TURTLE;
			}
			loadGraphic(nextClass, false, true);
			//HACK: Fixes the facing issue if facing = left and do loadGraphic().
			dirty = true;
			
			//move our center x to match the old center x.
			var dX:int = cX - centerX;
			x += dX;
			//and our bottom to match the old bottom
			var dY:int = btm - bottom;
			y += dY;
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
		
		
		public function get centerX():int
		{
			return x + width/2;
		}
		public function get centerY():int
		{
			return y + height/2;
		}
		public function get bottom():int
		{
			return y + height;
		}
	}

}