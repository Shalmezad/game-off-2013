package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		
		[Embed(source = "../res/map.csv", mimeType = "application/octet-stream")] 
		public var M_MAP:Class;
		
		
		[Embed(source = "../res/tileset.png")] 			
		private const G_TILES:Class;
		
		private var player:Player;
		private var world:FlxTilemap;
		
		public function GameState() 
		{
			world = new FlxTilemap();
			world.loadMap(new M_MAP, G_TILES, 20, 20);
			add(world);
			
			player = new Player();
			add(player);
		}
		
		
		override public function update():void
		{
			super.update();
			FlxG.collide(world, player);
			if (!player.onScreen()) {
				FlxG.switchState(new GameState());
			}
		}
	}

}