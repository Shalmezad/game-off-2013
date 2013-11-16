package  
{
	import org.flixel.*;
	public class EnemyGroup extends FlxGroup
	{
		private const NORMAL_SCREEN_COUNT:int = 5;
		private var enemyType:int = Enemy.TYPE_RANDOM;
		
		public function EnemyGroup() 
		{
			for (var i:int = 0; i < NORMAL_SCREEN_COUNT; i++) {
				//make an enemy
				var enemy:Enemy = new Enemy();
				//reset it
				enemy.start(enemyType);
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
				enemy.start(enemyType);
			}
		}
		
		public function change():void
		{
			enemyType = Enemy.TYPE_RANDOM;
			for each(var enemy:Enemy in members)
			{
				enemy.change();
			}
		}
		
		
		public function toSheep():void
		{
			enemyType = Enemy.TYPE_SHEEP;
			for each(var enemy:Enemy in members)
			{
				enemy.toSheep();
			}
		}
		
		public function toWizard():void
		{
			enemyType = Enemy.TYPE_WIZARD;
			for each(var enemy:Enemy in members)
			{
				enemy.toWizard();
			}
		}
		
		public function toGoblin():void
		{
			enemyType = Enemy.TYPE_GOBLIN;
			for each(var enemy:Enemy in members)
			{
				enemy.toGoblin();
			}
		}
	}

}