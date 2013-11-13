package  
{
	import org.flixel.*;
	public class Disco extends FlxSprite
	{
		
		public function Disco() 
		{
			loadGraphic(Assets.G_DISCO);
			this.alpha = .2;
			//align the center.
			var gameCenterX:int = Main.GAME_WIDTH / 2;
			var gameCenterY:int = Main.GAME_HEIGHT / 2;
			x += gameCenterX - width / 2;
			y += gameCenterY - height / 2;
		}
		override public function update():void
		{
			super.update();
			this.angle += .25;
		}
		
	}

}