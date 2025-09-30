from BBDD.config import get_conexion
from fastapi import HTTPException
from models.client_model import Client
import aiomysql


#Funcion para ver todos los clientes

async def get_clients_list():
    try:
        conn = await get_conexion()
        async with conn.cursor(aiomysql.DictCursor) as cursor:
            await cursor.execute('SELECT * FROM patitaschic.clients')
            data = await cursor.fetchall()
            
        return data
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error: {str(e)}")
    
    finally:
        conn.close()