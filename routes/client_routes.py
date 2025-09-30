from fastapi import APIRouter
from controllers import client_controller
from models.client_model import Client


router = APIRouter()

#Creacion de get_clients_list mediante Post para ver todos los clientes
@router.get('/', status_code=200)
async def get_all():
    return await client_controller.get_clients_list()

#Creacion de get_client_id mediante Get para ver 1 cliente buscandolo por su id
@router.get('/{client_id}', status_code=200)
async def get_client_id(client_id: int):
    return await client_controller.get_client_id(client_id)