from pydantic import BaseModel, EmailStr
from typing import Optional


class Client(BaseModel):
    id: int
    name: str
    last_name: str
    email: EmailStr
    password: str
    rol: str
    phone_number: int
    