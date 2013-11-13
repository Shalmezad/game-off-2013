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
		
	}

}