from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes import service_routes

app = FastAPI(debug=True)

#creo las rutas
# Creo acceso a la ruta service
app.include_router(service_routes.router,
                   prefix="/service",
                   tags=['Service'])

# Hago la conexión entre el back y el front
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:4200"],  # Solo tu front en desarrollo
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos los métodos: GET, POST, etc.
    allow_headers=["*"],  # Permite todos los headers
)