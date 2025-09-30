from fastapi import APIRouter
from controllers import client_controller
from models.client_model import Client


router = APIRouter()

#Creacion de get_clients_list mediante Post
@router.get('/', status_code=200)
async def get_all():
    return await client_controller.get_clients_list()