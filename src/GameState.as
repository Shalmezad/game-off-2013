package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var floor:Floor;
		private var changeTick:int = 0;
		private var gui:GUI;
		private var bullets:BulletGroup;
		private var enemyBullets:BulletGroup;
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
			enemyBullets = new BulletGroup();
			add(enemyBullets);
			
			gui = new GUI();
			add(gui);
		}
		
		
		override public function update():void
		{
			super.update();
			FlxG.collide(bullets, enemies, enemyBulletCollision);
			FlxG.overlap(Registry.player, enemies, enemyPlayerCollision);
			FlxG.overlap(Registry.player, enemyBullets, bulletPlayerCollision);
			changeTick++;
			if (changeTick >= 300) 
			{
				changeTick = 0;
				Registry.player.change();
				floor.change();
				
				var enemy:Enemy = enemies.getFirstAlive() as Enemy;
				if (enemy) 
				{
					enemyBullets.addBullet(enemy.x, enemy.y, enemy.angle, Assets.G_FIREBALL);			
				}
			}
			
			if (FlxG.mouse.justReleased()) 
			{
				bullets.addBullet(Registry.player.x, Registry.player.y, Registry.player.angle, Assets.G_BLUE_FIREBALL);
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
		
		private function bulletPlayerCollision(a:FlxObject, b:FlxObject):void
		{
			var bullet:Bullet;
			if (a instanceof Bullet)
				bullet = a as Bullet;
			else
				bullet = b as Bullet;
			bullet.kill();
			Registry.player.hurt(10);
		}
		
	}
}