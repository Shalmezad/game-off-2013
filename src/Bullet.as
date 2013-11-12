package  
{
	import org.flixel.*;
	public class Bullet extends FlxSprite
	{
		
		private const SPEED:int = 1;
		
		public function Bullet(x:int, y:int, angle:int) 
		{
			this.x = x;
			this.y = y;
			loadGraphic(Assets.G_FIREBALL);
			this.angle = angle;
		}
		
		override public function update():void
		{
			super.update();
			
			x += SPEED * Math.cos(angle * Math.PI / 180.0);
			y += SPEED * Math.sin(angle * Math.PI / 180.0);
			
			if (!onScreen()) {
				kill();
			}
		}
		
	}
}