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
		private var playerDead:Boolean = false;
		
		public function GameState() 
		{	
			floor = new Floor();
			add(floor);
			
			Registry.player = new Player();
			add(Registry.player);
			
			enemies = new FlxGroup();
			enemies.add(new Enemy());
			enemies.add(new Enemy());
			add(enemies);
			
			bullets = new BulletGroup();
			add(bullets);
			Registry.enemyBullets = new BulletGroup();
			add(Registry.enemyBullets);
			
			gui = new GUI();
			add(gui);
		}
		
		
		override public function update():void
		{
			super.update();
			FlxG.collide(bullets, enemies, enemyBulletCollision);
			FlxG.collide(enemies, enemies);
			FlxG.collide(Registry.player, enemies, enemyPlayerCollision);
			FlxG.overlap(Registry.player, Registry.enemyBullets, bulletPlayerCollision);
			changeTick++;
			if (changeTick >= 300) 
			{
				changeTick = 0;
				Registry.player.change();
				floor.change();
				for each(var enemy:Enemy in enemies.members) 
				{
					if (enemy.alive)
					{
						enemy.change();
					}
				}
			}
			
			if (FlxG.mouse.justReleased()) 
			{
				bullets.addBullet(	Registry.player.x, 
									Registry.player.y, 
									Registry.player.angle, 
									Assets.G_BLUE_FIREBALL);
			}
			gui.playerHealth = Registry.player.health;
			if (Registry.player.health <= 0 && !playerDead) 
			{
				playerDead = true;
				//add some explosions!!!
				add(new Explosion(Registry.player.x, Registry.player.y, 0xFFCC2222));
			}
		}
		
		private function enemyPlayerCollision(a:FlxObject, b:FlxObject):void
		{
			Registry.player.hurt(1);
		}
		
		private function enemyBulletCollision(a:FlxObject, b:FlxObject) :void
		{
			var enemy:Enemy;
			if (a is Enemy)
				enemy = a as Enemy;
			else
				enemy = b as Enemy;
			add(new Explosion(enemy.x, enemy.y, 0xFFAA0000));
			a.kill();
			b.kill();
			
		}
		
		private function bulletPlayerCollision(a:FlxObject, b:FlxObject):void
		{
			var bullet:Bullet;
			if (a is Bullet)
				bullet = a as Bullet;
			else
				bullet = b as Bullet;
			bullet.kill();
			Registry.player.hurt(10);
		}
		
	}
}