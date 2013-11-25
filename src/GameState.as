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
			
			FlxG.collide(Registry.player, gui.slotBG);
			FlxG.collide(Registry.enemies, gui.slotBG);
			
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
				bullets.addBullet(	Registry.player.centerX, 
									Registry.player.centerY, 
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
					FlxG.switchState(new GameOverState(gui.score));
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
			if (Registry.player.playerType != Player.TYPE_GOLEM && 
				Registry.player.playerType != Player.TYPE_GOBLIN)
			{
				Registry.player.hurt(1);
			}
			if (Registry.player.playerType == Player.TYPE_GOBLIN || 
				Registry.player.playerType == Player.TYPE_GOLEM) 
			{
				if (enemy.enemyType != Enemy.TYPE_GOLEM)
				{
					gui.addScore(enemy.enemyType);
					enemy.kill();
				}
			}
		}
		
		private function enemyBulletCollision(a:FlxObject, b:FlxObject) :void
		{
			var enemy:Enemy;
			var bullet:Bullet;
			if (a is Enemy)
			{
				enemy = a as Enemy;
				bullet = b as Bullet;
			}
			else
			{
				enemy = b as Enemy;
				bullet = a as Bullet;
			}
			if (enemy.enemyType != Enemy.TYPE_GOLEM)
			{
				enemy.kill();
				gui.addScore(enemy.enemyType);
				add(new Explosion(enemy.x, enemy.y, 0xFFAA0000));
			}
			bullet.kill();
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
			if (Registry.player.playerType != Player.TYPE_GOLEM)
			{
				Registry.player.hurt(5);
			}
		}
		
	}
}