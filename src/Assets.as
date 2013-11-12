package  
{

	public class Assets 
	{
		//Tiles
		[Embed(source = "../res/tileset.png")] 			
		public static const G_TILES:Class;
		
		//ENEMIES!!!
		[Embed(source = "../res/black-sheep.png")] 			
		public static const G_BLACK_SHEEP:Class;	//Every family has one. This game has many
		
		//Player
		[Embed(source = "../res/wizard.png")] 			
		public static const G_WIZARD:Class;
		[Embed(source = "../res/sheep.png")] 			
		public static const G_SHEEP:Class;
		
		//Projectiles
		[Embed(source = "../res/fireball.png")] 			
		public static const G_FIREBALL:Class;
	}

}