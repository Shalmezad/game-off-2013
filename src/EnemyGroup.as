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
		
		public function change():void
		{
			for each(var enemy:Enemy in members)
			{
				enemy.change();
			}
		}
		
		
		public function toSheep():void
		{
			for each(var enemy:Enemy in members)
			{
				enemy.toSheep();
			}
		}
		
		public function toWizard():void
		{
			for each(var enemy:Enemy in members)
			{
				enemy.toWizard();
			}
		}
		
		public function toGoblin():void
		{
			for each(var enemy:Enemy in members)
			{
				enemy.toGoblin();
			}
		}
	}

}