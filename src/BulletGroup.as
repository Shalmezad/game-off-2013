package  
{
	import org.flixel.*;
	public class BulletGroup extends FlxGroup
	{
		
		public function BulletGroup() 
		{
			
		}
		override public function update():void
		{
			super.update();
		}
		public function addBullet(x:int, y:int, angle:int):void
		{
			var bullet:Bullet = recycle(Bullet) as Bullet;
			bullet.start(x, y, angle);
		}
	}

}