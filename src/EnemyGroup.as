package  
{
	import org.flixel.*;
	public class EnemyGroup extends FlxGroup
	{
		private const NORMAL_SCREEN_COUNT:int = 5;
		public function EnemyGroup() 
		{
			for (var i:int = 0; i < NORMAL_SCREEN_COUNT; i++) {
				//make an enemy
				var enemy:Enemy = new Enemy();
				//reset it
				enemy.start();
				//add it
				add(enemy);
			}
		}
		
		override public function update():void
		{
			super.update();
			//check the number of alive
			if (this.countLiving() < NORMAL_SCREEN_COUNT)
			{
				//we need to make some more!
				var enemy:Enemy = recycle(Enemy) as Enemy;
				enemy.start();
			}
		}
	}

}