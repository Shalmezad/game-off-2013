package  
{
	import org.flixel.*;
	public class Bullet extends FlxSprite
	{
		
		private const SPEED:int = 1;
		
		public function Bullet() 
		{
			loadGraphic(Assets.G_FIREBALL);
		}
		
		public function start(x:int, y:int, angle:int):void
		{
			this.angle = angle;
			this.x = x;
			this.y = y;
			this.exists = true;
			this.alive = true;
		}
		
		override public function update():void
		{
			super.update();
			
			x += SPEED * Math.cos(angle * Math.PI / 180.0);
			y += SPEED * Math.sin(angle * Math.PI / 180.0);
			
			if (!onScreen()) 
			{
				kill();
			}
		}
		
	}
}