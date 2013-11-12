package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var floor:Floor;
		//private var player:Player;
		private var changeTick:int = 0;
		private var gui:GUI;
		private var bullets:BulletGroup;
		
		public function GameState() 
		{	
			floor = new Floor();
			add(floor);
			
			//player = new Player();
			Registry.player = new Player();
			add(Registry.player);
						
			bullets = new BulletGroup();
			add(bullets);
			
			gui = new GUI();
			add(gui);
		}
		
		
		override public function update():void
		{
			super.update();
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
		
		
		
	}
}