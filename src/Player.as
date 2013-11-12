package  
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		
		private var changeColor:int = 0;
		public function Player() 
		{
			loadGraphic(Assets.G_WIZARD);
		}
		

		
		override public function update():void
		{
			super.update();
			
			if (Key.UP && !Key.DOWN) {
				y--;
			}
			else if (Key.DOWN && !Key.UP) {
				y++;
			}
			
			if (Key.LEFT && !Key.RIGHT) {
				x--;
			}
			else if (Key.RIGHT && !Key.LEFT) {
				x++;
			}
			
			angle = Math.atan2(FlxG.mouse.y - y, FlxG.mouse.x - x) / Math.PI * 180 + 90;
			
			changeColor+= 5;
			if (changeColor > 255)
				changeColor = 255;
			var intVal:int = changeColor << 16 | changeColor << 8 | changeColor;
			this.color = intVal;
		}
		
	}

}