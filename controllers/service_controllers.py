from BBDD.config import get_conexion
from fastapi import HTTPException
from routes import service_routes
from models.service_model import Service
import aiomysql


#_______________________________GET___________________________________

async def get_service_list():
    try:
        conn=await get_conexion()
        async with conn.cursor(aiomysql.DictCursor) as cursor:
            await cursor.execute('SELECT * FROM patitaschic.service')
            data = await cursor.fetchall()
        return data
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error: {str(e)}")
    
    finally:
        conn.close()

#_______________________________GET_BY_ID_________________________________

async def get_service_id(service_id:int):
    try:
        conn=await get_conexion()
        async with conn.cursor(aiomysql.DictCursor) as cursor:
            await cursor.execute('SELECT * FROM patitaschic.service WHERE id=%s', (service_id))
            service = await cursor.fetchone()
            if not service:
                raise HTTPException(
                    status_code=404, detail='Servicio no encontrado'
                )
            else:
                return service
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error: {str(e)}")
    
    finally:
        conn.close()