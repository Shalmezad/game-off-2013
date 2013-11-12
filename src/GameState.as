package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var player:Player;
		private var changeTick:int = 0;
		
		public function GameState() 
		{	
			var mapString:String = "";
			var background:FlxTilemap = new FlxTilemap();
			for (var i:int = 0; i < Main.GAME_HEIGHT / 20; i++) {
				if (i != 0)
					mapString += "\n";
				for (var j:int = 0; j < Main.GAME_WIDTH; j++) {
					if (j != 0)
						mapString += ",";
					mapString += "0";
				}
			}
			background.loadMap(mapString, Assets.G_ICE_TILE, 20, 20, FlxTilemap.OFF, 0,0);
			add(background);
			
			player = new Player();
			add(player);
			
			var branding:FlxText;
			branding = new FlxText(320 - 100, 5, 100, "Shalmezad");
			add(branding);
		}
		
		
		override public function update():void
		{
			super.update();
			changeTick++;
			if (changeTick >= 300) {
				changeTick = 0;
				player.change();
			}
			
			if (FlxG.mouse.justReleased()) {
				add(new Bullet(player.x, player.y, player.angle));
			}
		}
		
		
		
	}

}