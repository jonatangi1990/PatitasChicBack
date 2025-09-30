import os
import aiomysql
from dotenv import load_dotenv


load_dotenv()

async def get_conexion():
    return await aiomysql.connect(
        host=os.getenv("MYSQL_HOST", "localhost"),
        port=int(os.getenv("MYSQL_PORT", 3306)),
        user=os.getenv("MYSQL_USER", "root"),
        password=os.getenv("MYSQL_PASSWORD", "Campon8011"),
        db=os.getenv("MYSQL_DATABASE", "patitaschic")
    )