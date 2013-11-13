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
		public function addBullet(x:int, y:int, angle:int, graphic:Class):void
		{
			var bullet:Bullet = recycle(Bullet) as Bullet;
			bullet.loadGraphic(graphic);
			bullet.start(x, y, angle);
		}
	}

}