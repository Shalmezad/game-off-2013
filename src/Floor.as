package  
{
	import org.flixel.*;
	public class Floor extends FlxTilemap
	{
		private var mapString:String;
		public function Floor() 
		{
			mapString = "";
			for (var i:int = 0; i < Main.GAME_HEIGHT / 20; i++) 
			{
				if (i != 0)
					mapString += "\n";
				for (var j:int = 0; j < Main.GAME_WIDTH; j++) 
				{
					if (j != 0)
						mapString += ",";
					mapString += "0";
				}
			}
			loadMap(mapString, Assets.G_TILES, 20, 20, FlxTilemap.OFF, 0,0);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function change():void
		{
			var changeTile:int = Math.random() * 3;
			if (changeTile == 0)
				toIce();
			else if (changeTile == 1)
				toTile();
			else
				toSand();
		}
		
		private function toIce():void
		{			
			for (var i:int = 0; i < Main.GAME_HEIGHT / 20; i++) 
			{
				for (var j:int = 0; j < Main.GAME_WIDTH; j++) 
				{
					setTile(j, i, 0);
				}
			}
		}
		private function toSand():void
		{
			for (var i:int = 0; i < Main.GAME_HEIGHT / 20; i++) 
			{
				for (var j:int = 0; j < Main.GAME_WIDTH; j++) 
				{
					setTile(j, i, 1);
				}
			}
		}
		private function toTile():void
		{
			for (var i:int = 0; i < Main.GAME_HEIGHT / 20; i++) 
			{
				for (var j:int = 0; j < Main.GAME_WIDTH; j++) 
				{
					setTile(j, i, 2);
				}
			}
		}
	}

}