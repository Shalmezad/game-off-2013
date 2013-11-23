package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var floor:Floor;
		private var changeTick:int = 0;
		private var gui:GUI;
		private var bullets:BulletGroup;
		//private var enemies:EnemyGroup;
		private var playerDead:Boolean = false;
		private var coolDown:int = 0;
		private var deadCount:int = 0;
		
		public function GameState() 
		{	
			Registry.floor = new Floor();
			add(Registry.floor);
			
			Registry.player = new Player();
			add(Registry.player);
			
			Registry.enemies = new EnemyGroup();
			add(Registry.enemies);
			
			bullets = new BulletGroup();
			add(bullets);
			Registry.enemyBullets = new BulletGroup();
			add(Registry.enemyBullets);
			
			add(new Disco());
			
			gui = new GUI();
			add(gui);
		}
		
		
		override public function update():void
		{
			super.update();
			if (Key.RESET)
			{
				FlxG.switchState(new GameState());
			}
			FlxG.collide(bullets, Registry.enemies, enemyBulletCollision);
			FlxG.collide(Registry.enemies, Registry.enemies);
			FlxG.collide(Registry.player, Registry.enemies, enemyPlayerCollision);
			FlxG.overlap(Registry.player, Registry.enemyBullets, bulletPlayerCollision);
			changeTick++;
			if (changeTick >= 1000) 
			{
				changeTick = 0;
				gui.startSlots();
				//Registry.floor.change();
			}
			coolDown--;
			if (FlxG.mouse.pressed() && 
				Registry.player.playerType == Player.TYPE_WIZARD &&
				Registry.player.health > 0 &&
				coolDown <= 0) 
			{
				coolDown = 20;
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
			if (playerDead)
			{
				deadCount++;
				if (deadCount > 120)
				{
					FlxG.switchState(new MenuState());
				}
			}
		}
		
		private function enemyPlayerCollision(a:FlxObject, b:FlxObject):void
		{
			var enemy:Enemy;
			if (a is Enemy)
			{
				enemy = a as Enemy;
			}
			else
			{
				enemy = b as Enemy;
			}
			Registry.player.hurt(1);
			if (Registry.player.playerType == Player.TYPE_GOBLIN) {
				enemy.kill();
				Registry.player.health += 1;
			}
		}
		
		private function enemyBulletCollision(a:FlxObject, b:FlxObject) :void
		{
			var enemy:Enemy;
			if (a is Enemy)
			{
				enemy = a as Enemy;
			}
			else
			{
				enemy = b as Enemy;
			}
			add(new Explosion(enemy.x, enemy.y, 0xFFAA0000));
			a.kill();
			b.kill();
			
		}
		
		private function bulletPlayerCollision(a:FlxObject, b:FlxObject):void
		{
			var bullet:Bullet;
			if (a is Bullet)
			{
				bullet = a as Bullet;
			}
			else
			{
				bullet = b as Bullet;
			}
			bullet.kill();
			Registry.player.hurt(5);
		}
		
	}
}