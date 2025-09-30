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
        
#Funcion para buscar un cliente por id
async def get_client_id(client_id: int):
    try:
        conn = await get_conexion()
        async with conn.cursor(aiomysql.DictCursor) as cursor:
            await cursor.execute('SELECT * FROM patitaschic.clients WHERE id=%s', (client_id))
            client = await cursor.fetchone()
            if not client:
                raise HTTPException(
                    status_code=404, detail='Cliente no encontrado'
                )
            else:
                return client
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error: {str(e)}")
    finally:
        conn.close()