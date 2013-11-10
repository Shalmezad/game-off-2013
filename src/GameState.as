package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		
		[Embed(source = "../res/map.csv", mimeType = "application/octet-stream")] 
		public var M_MAP:Class;
		
		[Embed(source = "../res/tileset.png")] 			
		private const G_TILES:Class;
		
		[Embed(source = "../res/tileset2.png")] 			
		private const G_TILES_2:Class;
		
		private var player:Player;
		private var world:FlxTilemap;
		private var changeCloud:PoofCloud;
		
		public function GameState() 
		{
			world = new FlxTilemap();
			//world.loadMap(new M_MAP, G_TILES, 20, 20);
			world.loadMap(new M_MAP, G_TILES_2, 20, 20, FlxTilemap.AUTO);
			add(world);
			
			player = new Player();
			add(player);
			
			changeCloud = new PoofCloud();
			add(changeCloud);
			
			var branding:FlxText;
			branding = new FlxText(320 - 100, 5, 100, "Shalmezad");
			add(branding);
		}
		
		
		override public function update():void
		{
			super.update();
			FlxG.collide(world, player);
			if (!player.onScreen()) {
				FlxG.switchState(new GameState());
			}
			if (Key.JUST_RELEASED_CHANGE)
			{
				//time to change the player
				player.changeState();
				//add some fun "poof" effects:
				changeCloud.x = player.centerX;
				changeCloud.y = player.centerY;
				changeCloud.start(true, .5, .1);
			}
		}
	}

}