package  
{
	import org.flixel.*;
	public class Bullet extends FlxSprite
	{
		
		private const SPEED:int = 1;
		private var xSpeed:Number;
		private var ySpeed:Number;
		
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
			this.xSpeed = SPEED * Math.cos(angle * Math.PI / 180.0);
			this.ySpeed = SPEED * Math.sin(angle * Math.PI / 180.0);
		}
		
		override public function update():void
		{
			super.update();
			
			x += this.xSpeed;
			y += this.ySpeed;
			
			if (!onScreen()) 
			{
				kill();
			}
		}
		
	}
}