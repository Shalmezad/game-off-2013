package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var floor:Floor;
		private var changeTick:int = 0;
		private var gui:GUI;
		private var bullets:BulletGroup;
		private var enemies:FlxGroup;
		
		public function GameState() 
		{	
			floor = new Floor();
			add(floor);
			
			Registry.player = new Player();
			add(Registry.player);
			
			enemies = new FlxGroup();
			enemies.add(new Enemy());
			add(enemies);
			
			bullets = new BulletGroup();
			add(bullets);
			
			gui = new GUI();
			add(gui);
		}
		
		
		override public function update():void
		{
			super.update();
			FlxG.collide(bullets, enemies, enemyBulletCollision);
			FlxG.overlap(Registry.player, enemies, enemyPlayerCollision);
			changeTick++;
			if (changeTick >= 300) 
			{
				changeTick = 0;
				Registry.player.change();
				floor.change();
			}
			
			if (FlxG.mouse.justReleased()) 
			{
				bullets.addBullet(Registry.player.x, Registry.player.y, Registry.player.angle);
			}
			gui.playerHealth = Registry.player.health;
		}
		
		private function enemyPlayerCollision(a:FlxObject, b:FlxObject):void
		{
			Registry.player.hurt(1);
		}
		
		private function enemyBulletCollision(a:FlxObject, b:FlxObject) :void
		{
			a.kill();
			b.kill();
		}
		
	}
}