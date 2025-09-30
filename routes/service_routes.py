from fastapi import APIRouter
from controllers import service_controllers

router= APIRouter()

#Obtenemos todos los servicios
@router.get('/', status_code=200)
async def get_all():
    return await service_controllers.get_service_list()