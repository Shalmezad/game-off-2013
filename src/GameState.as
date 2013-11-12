package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var floor:Floor;
		private var player:Player;
		private var changeTick:int = 0;
		private var gui:GUI;
		private var bullets:BulletGroup;
		
		public function GameState() 
		{	
			floor = new Floor();
			add(floor);
			
			player = new Player();
			add(player);
			
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
				player.change();
				floor.change();
			}
			
			if (FlxG.mouse.justReleased()) 
			{
				bullets.addBullet(player.x, player.y, player.angle);
			}
			gui.playerHealth = player.health;
		}
		
		
		
	}
}